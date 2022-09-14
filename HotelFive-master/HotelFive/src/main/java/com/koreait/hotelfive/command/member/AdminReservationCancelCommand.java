package com.koreait.hotelfive.command.member;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class AdminReservationCancelCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int rNo = Integer.parseInt(request.getParameter("rNo")); 
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		
		hDAO.adminReservationCancel(rNo); // 예약취소하기
	}

}
