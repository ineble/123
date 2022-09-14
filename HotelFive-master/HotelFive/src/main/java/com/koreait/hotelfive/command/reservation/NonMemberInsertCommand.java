package com.koreait.hotelfive.command.reservation;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class NonMemberInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		// 비회원 정보 
		String nmName = request.getParameter("nmName");
		String nmPhone = request.getParameter("nmPhone");

		model.addAttribute("nmName", nmName);
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		int result = hDAO.selectNonmemberExistence(nmPhone);
		if ( result == 0) {
			hDAO.insertNonMember(nmName, nmPhone);
		}
	}

}
