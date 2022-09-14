package com.koreait.hotelfive.command.reviewboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.common.PageMaker2;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReviewDTO;

public class CheckReviewBoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> mMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) mMap.get("request");
		String gName = request.getParameter("gName");
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int recordPerPage = 5;
		int beginRecord = ( page-1 ) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("beginRecord", beginRecord+"");
		map.put("endRecord", endRecord+"");
		map.put("gName", gName);
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<ReviewDTO> list = hDAO.selectCheckReviewBoardList(map);
		
		int totalRecord = hDAO.getReviewTotalCheckRecord(gName);
		
		String pageView2 = PageMaker2.getPageView("checkReviewBoard", page, recordPerPage, totalRecord, gName);  
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("pageView2", pageView2);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("gName", gName);
	}

}
