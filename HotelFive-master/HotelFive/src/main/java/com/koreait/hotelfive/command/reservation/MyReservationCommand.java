package com.koreait.hotelfive.command.reservation;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReservationDTO;

public class MyReservationCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map< String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<ReservationDTO> list = hDAO.selectMyReservation(mNo);
		model.addAttribute("list", list);
	}

}
