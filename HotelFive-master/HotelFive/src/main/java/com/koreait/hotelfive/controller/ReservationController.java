package com.koreait.hotelfive.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.command.reservation.BookableListCommand;
import com.koreait.hotelfive.command.reservation.MyReservationCommand;
import com.koreait.hotelfive.command.reservation.NonMemberInsertCommand;
import com.koreait.hotelfive.command.reservation.NonMemberReservationCancleCommand;
import com.koreait.hotelfive.command.reservation.NonMemberReservationCommand;
import com.koreait.hotelfive.command.reservation.PayCommand;
import com.koreait.hotelfive.command.reservation.ReservationCancleCommand;
import com.koreait.hotelfive.command.reservation.ReservationPageCommand;

@Controller
public class ReservationController {

	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	@RequestMapping("selectBookable")
	public String selectA(HttpServletRequest request, Model model) {
	
		model.addAttribute("request", request);
		command = new BookableListCommand();
		command.execute(sqlSession, model);
		
		return "reservation/bookableList";
	}
	
	@RequestMapping("nonMemberReservationCancle")
	   public String nonMemberReservationCancle(HttpServletRequest request, Model model) {
	      model.addAttribute("request", request);
	      command = new NonMemberReservationCancleCommand();
	      command.execute(sqlSession, model);
	      return "index";
	   }

	@RequestMapping("reservationPage")
	public String reservationPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		// GUESTROOM 테이블의 GNAME, GPRICE, GMINPEOPLE, GMAXPEOPLE 불러오기
		// 추가로 넘겨줄 값 : 체크인날짜, 체크아웃날짜
		// 넘어가는값 : GNO
		model.addAttribute("rCheckIn", request.getParameter("rCheckIn"));
		model.addAttribute("rCheckOut", request.getParameter("rCheckOut"));
		command = new ReservationPageCommand();
		command.execute(sqlSession, model);
		return "reservation/reservationPage";
	}
	@RequestMapping("pay1")
	public String pay1(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new PayCommand(); // 
		command.execute(sqlSession, model);
		
		return "reservation/confirmReservationPage";
	}
	@RequestMapping("pay2")
	public String pay2(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new NonMemberInsertCommand(); //
		command.execute(sqlSession, model);

		command = new PayCommand(); // 
		command.execute(sqlSession, model);
		
		return "reservation/confirmReservationPage";
	}
	
	@RequestMapping("MyReservation")
	public String selectMyReservation(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new MyReservationCommand();
		command.execute(sqlSession, model);
		
		return  "myPage/myReservation";
	}
		
	@RequestMapping("reservationCancle")
	public String doReservationCancle(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new ReservationCancleCommand();
		command.execute(sqlSession, model);
		
		return "redirect:MyReservation?mNo="+request.getParameter("mNo");
	}
	
	// 비회원 예약확인 
	@RequestMapping(value="selectNonMemberReservationPage", method=RequestMethod.POST)
	public String selectNonMemberReservationPage(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		command = new NonMemberReservationCommand();
		command.execute(sqlSession, model);
		return "reservation/nonMemberReservationPage";
	}
	
}
