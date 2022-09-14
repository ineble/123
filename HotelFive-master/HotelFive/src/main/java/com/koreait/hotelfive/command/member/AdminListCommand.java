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
import com.koreait.hotelfive.dto.MemberDTO;

public class AdminListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map1 = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map1.get("request");
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// page 를 알아야 가져올 list 의 begin 과 end 를 알 수 있다.(ex. 1 ~ 10, 11 ~ 20)
		int recordPerPage = 5; // 한페이지의 게시물 갯수
		int beginRecord = (page -1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		// beginRecord + endRecord = Map
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("beginRecord", beginRecord);
		map2.put("endRecord", endRecord);
		
		// DB에서 list 가져오기
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<MemberDTO> list = hDAO.userList(map2);
		
		// 전체 게시글 갯수 구하기
		int totalRecord = hDAO.getTotalMember();
		
		// 페이지 ( << 1 2 3 >> )
		String pageView = PageMaker.getPageView("adminList", 
												page, 
												recordPerPage, 
												totalRecord);
		// request 에 저장해서 전달할 데이터
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalRecord", totalRecord);
	}
}
