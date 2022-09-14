package com.koreait.hotelfive.command.qnaboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class QNABoardInsertCommand2 implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mId = "";
		String nmName = request.getParameter("nmName");
		String qTitle = request.getParameter("qTitle");
		String qPw = request.getParameter("qPw");
		String qContent = request.getParameter("qContent");
		
		HotelFiveDAO qDAO = sqlSession.getMapper(HotelFiveDAO.class);
		qDAO.insertQNABoard2(mId, nmName, qTitle, qPw, qContent, 1);

	}

}
