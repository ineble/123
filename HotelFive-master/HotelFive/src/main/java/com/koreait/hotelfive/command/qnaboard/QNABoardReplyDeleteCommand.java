package com.koreait.hotelfive.command.qnaboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class QNABoardReplyDeleteCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int reNo = Integer.parseInt(request.getParameter("reNo"));
		
		HotelFiveDAO reDAO = sqlSession.getMapper(HotelFiveDAO.class);
		reDAO.deleteQNABoardReply(reNo);
		
	}

}
