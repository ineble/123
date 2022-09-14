package com.koreait.hotelfive.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.GuestRoomDTO;

public class RoomViewCommand implements Command {
	
	// 객실 상세정보 Command
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int gNo = Integer.parseInt(request.getParameter("gNo"));
		String gName = request.getParameter("gName");
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		
		GuestRoomDTO gDTO = hDAO.guestRoomView(gNo);
		Double Rating = hDAO.guestRoomRating(gName);
		int Vote = hDAO.guestRoomRatingVote(gName);
		
		model.addAttribute("gDTO", gDTO);
		model.addAttribute("Rating", Rating);
		model.addAttribute("Vote", Vote);

	}

}
