package com.koreait.hotelfive.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.MemberDTO;

public class PayCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		String gName = request.getParameter("gName");
		String rCheckIn = request.getParameter("rCheckIn");
		String rCheckOut = request.getParameter("rCheckOut");
		int rPeople = Integer.parseInt(request.getParameter("rPeople"));
		int rPrice = Integer.parseInt(request.getParameter("rPrice"));
		
		HttpSession session = request.getSession();
		MemberDTO mDTO = (MemberDTO) session.getAttribute("loginDTO");

		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		
		Integer rNo = hDAO.confirmReservation(gNo, rCheckIn, rCheckOut);
		if (rNo == null ) {
			int result = 0;
			if(mDTO != null) {
				result = hDAO.insertReservation1(gNo, mDTO.getmNo(), rPeople, rPrice, rCheckIn, rCheckOut);
				
			}else {
				String nmId = hDAO.selectNmId(request.getParameter("nmPhone"));
				result = hDAO.insertReservation2(gNo, nmId, rPeople, rPrice, rCheckIn, rCheckOut);
			}
		}
		
			model.addAttribute("gName", gName);
			model.addAttribute("rCheckIn", rCheckIn);
			model.addAttribute("rCheckOut", rCheckOut);
			model.addAttribute("rPrice", rPrice);

	}
	


}
