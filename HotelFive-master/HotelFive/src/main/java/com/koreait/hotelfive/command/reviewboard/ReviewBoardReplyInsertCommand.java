package com.koreait.hotelfive.command.reviewboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class ReviewBoardReplyInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = request.getParameter("mId");
		String reContent = request.getParameter("reContent");
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		HotelFiveDAO reDAO = sqlSession.getMapper(HotelFiveDAO.class);
		reDAO.insertReviewBoardReply(mId, reContent, rNo);

	}

}
