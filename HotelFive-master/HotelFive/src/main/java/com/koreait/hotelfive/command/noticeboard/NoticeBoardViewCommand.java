package com.koreait.hotelfive.command.noticeboard;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class NoticeBoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int nNo = Integer.parseInt(request.getParameter("nNo"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		
		// 조회수 증가 
		HttpSession session = request.getSession();
		String open = (String) session.getAttribute("open");
		if ( open == null ) {
			session.setAttribute("open", "YES");
			hDAO.updateNoticeBoardHit(nNo);
		}
		
		model.addAttribute("nDTO", hDAO.selectNoticeBoardBynNo(nNo));
		model.addAttribute("page", page);
	}

}
