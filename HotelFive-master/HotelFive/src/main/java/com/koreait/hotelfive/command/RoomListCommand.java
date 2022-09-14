package com.koreait.hotelfive.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.dao.HotelFiveDAO;

public class RoomListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
	    model.addAttribute("list", hDAO.guestRoomList());
		
	}

}
