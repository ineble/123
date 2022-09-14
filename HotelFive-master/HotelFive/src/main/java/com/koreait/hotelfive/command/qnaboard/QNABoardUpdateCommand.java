package com.koreait.hotelfive.command.qnaboard;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class QNABoardUpdateCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		HotelFiveDAO qDAO = sqlSession.getMapper(HotelFiveDAO.class);
		qDAO.updateQNABoard(qTitle, qContent, qNo);
		
		model.addAttribute("qNo", qNo);
		
	}

}
