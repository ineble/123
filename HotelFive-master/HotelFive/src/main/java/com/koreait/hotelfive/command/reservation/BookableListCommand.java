package com.koreait.hotelfive.command.reservation;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.GuestRoomDTO;

public class BookableListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String rCheckIn = request.getParameter("rCheckIn");
		String rCheckOut = request.getParameter("rCheckOut");
		
		HotelFiveDAO hDAO= sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<GuestRoomDTO> list = hDAO.selectBookableList(rCheckOut, rCheckIn);
		
		model.addAttribute("list", list);
		model.addAttribute("rCheckIn", rCheckIn);
		model.addAttribute("rCheckOut", rCheckOut);
	}

}
