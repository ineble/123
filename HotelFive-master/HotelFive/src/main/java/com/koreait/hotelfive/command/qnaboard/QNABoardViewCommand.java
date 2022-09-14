package com.koreait.hotelfive.command.qnaboard;

import java.util.ArrayList;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReplyDTO;

public class QNABoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		HotelFiveDAO qDAO = sqlSession.getMapper(HotelFiveDAO.class);
		HotelFiveDAO reDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<ReplyDTO> reList = reDAO.selectQNABoardReply(qNo);
		model.addAttribute("qDTO", qDAO.selectByqNo(qNo));
		model.addAttribute("reList", reList);

	}

}
