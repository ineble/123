package com.koreait.hotelfive.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.hotelfive.command.Command;

@Controller
public class HotelFiveController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private JavaMailSender mailSender;  // root-context.xml 의 빈 자동 생성
	private Command command;

	
	// 단순 홈페이지 이동
	@RequestMapping("/")
	public String goMainPage() {
		return "index";
	}
	@RequestMapping("main") 
	public String goMainPage2() {
		return "index";
	}
	@RequestMapping("hotelInfo")
	public String goHotelInfo() {
		return "hotelInfo";
	}
	@RequestMapping("reservation")
	public String goReservation() {
		return "reservation/bookableList";
	}
	@RequestMapping("findReservationNumber")
	public String gofindReservationNumber() {
		return "reservation/findReservationNumber";
	}
	

}
