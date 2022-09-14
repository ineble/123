package com.koreait.hotelfive.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.command.RoomListCommand;
import com.koreait.hotelfive.command.RoomViewCommand;

@Controller
public class GuestRoomController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;

	
	// 객실정보 리스트
		@RequestMapping("roomListPage")
		public String roomListPage(Model model) {
			command = new RoomListCommand();
			command.execute(sqlSession, model);
			return "guestroom/roomListPage";
		}
		   
		// 객실 상세정보 리스트
		@RequestMapping("roomViewPage")
		public String roomViewPage(HttpServletRequest request, Model model) {
			// 객실 번호 넘기기 	
			model.addAttribute("request", request);	
			command = new RoomViewCommand();
			command.execute(sqlSession, model);
			return "guestroom/roomViewPage";
		}
}
