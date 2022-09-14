package com.koreait.hotelfive.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.MemberDTO;

public class MyViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String mId = request.getParameter("mId");
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		MemberDTO mDTO = hDAO.idCheck(mId);
		
		
		model.addAttribute("mDTO", mDTO);
		
	}

}
