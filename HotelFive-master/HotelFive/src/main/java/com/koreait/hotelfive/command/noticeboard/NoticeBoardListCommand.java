package com.koreait.hotelfive.command.noticeboard;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.common.PageMaker;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.NoticeDTO;

public class NoticeBoardListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> mMap = model.asMap();
		HttpServletRequest request = (HttpServletRequest) mMap.get("request");
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		 }
			
		int recordPerPage = 5;
		int beginRecord = ( page-1 ) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;

		Map<String, Integer> map = new HashMap<String, Integer>();
	    map.put("beginRecord", beginRecord);
	    map.put("endRecord", endRecord);

	    // session 에 저장된 open 속성 삭제
 		HttpSession session = request.getSession();
 		session.removeAttribute("open");
	    
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<NoticeDTO> list = hDAO.selectNoticeBoardList(map);
		
		int totalRecord = hDAO.getTotalRecordNotice();
		String pageView = PageMaker.getPageView("noticeBoardListPage", page, recordPerPage, totalRecord); 
		model.addAttribute("list", list);
		model.addAttribute("page", page);
	    model.addAttribute("pageView", pageView);
	    model.addAttribute("totalRecord", totalRecord);

	}

}
