package com.koreait.hotelfive.command.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.common.PageMaker;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.QNADTO;

public class MyBoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> mMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) mMap.get("request");
		String mId = request.getParameter("mId");
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordPerPage = 10;
		int beginRecord = ( page-1 ) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mId", mId);
		map.put("beginRecord", beginRecord+"");
		map.put("endRecord", endRecord+"");
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<QNADTO> list = hDAO.selectMyBoardList(map);
		int totalRecord = hDAO.getTotalRecord();
		String pageView = PageMaker.getPageView("myBoardView", page, recordPerPage, totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);
		

	}

}
