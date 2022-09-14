package com.koreait.hotelfive.command.reservation;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReservationDTO;

public class NonMemberReservationCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String nmName = request.getParameter("nmName");
		String nmPhone = request.getParameter("nmPhone");
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<ReservationDTO> list = hDAO.selectNonmemberReservation(nmName, nmPhone);
		model.addAttribute("list", list);
		model.addAttribute("nmName", nmName);
		model.addAttribute("nmPhone", nmPhone);

	}

}
