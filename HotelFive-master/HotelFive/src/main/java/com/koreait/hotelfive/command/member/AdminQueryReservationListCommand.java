package com.koreait.hotelfive.command.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.common.ReservationQueryPageMaker;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReservationViewDTO;

public class AdminQueryReservationListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map1 = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map1.get("request");
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		HttpSession session = request.getSession();
	      if(request.getParameter("query") != null || request.getParameter("column") != null) {
	         session = request.getSession();
	         session.setAttribute("column", request.getParameter("column"));
	         session.setAttribute("query", request.getParameter("query"));
	      }
		
		// 검색 파라미터
		String column = request.getParameter("column");  // 검색할 칼럼
		String query = request.getParameter("query");  // 검색할 내용
		
		// page 를 알아야 가져올 list 의 begin 과 end 를 알 수 있다.(ex. 1 ~ 10, 11 ~ 20)
		int recordPerPage = 5; // 한페이지의 게시물 갯수
		int beginRecord = (page -1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		// beginRecord + endRecord = Map
		Map<String, String> map2 = new HashMap<String, String>();
		map2.put("beginRecord", beginRecord + "");
		map2.put("endRecord", endRecord + "");
		map2.put("column", column);
		map2.put("query", query);
		
		// DB에서 list 가져오기
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		ArrayList<ReservationViewDTO> reservationList = hDAO.queryAdminReservationList(map2);
		
		// 전체 게시글 갯수 구하기
		int totalReservation = hDAO.getQueryReservationRecord(map2); // 다오 만들고, 그 맵퍼 토탈레코드 조건 준거 
		
		// 페이지 ( << 1 2 3 >> )
		String pageView = ReservationQueryPageMaker.getPageView("queryAdminReservationPage",  
												page, 
												recordPerPage, 
												totalReservation, query, column);
		// request 에 저장해서 전달할 데이터
		model.addAttribute("page", page);
		model.addAttribute("reservationList", reservationList);
		model.addAttribute("pageView", pageView);
		model.addAttribute("totalReservation", totalReservation);
	}
}
