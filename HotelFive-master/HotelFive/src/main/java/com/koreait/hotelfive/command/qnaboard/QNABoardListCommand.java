package com.koreait.hotelfive.command.qnaboard;

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

public class QNABoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> mMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) mMap.get("request");
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordPerPage = 10;
		int beginRecord = ( page-1 ) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("beginRecord", beginRecord);
		map.put("endRecord", endRecord);
		
		HotelFiveDAO qDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<QNADTO> list = qDAO.selectQNABoard(map);
		
		int totalRecord = qDAO.getTotalRecord();
		String pageView = PageMaker.getPageView("qnaBoardList", page, recordPerPage, totalRecord);  
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);

	}

}
