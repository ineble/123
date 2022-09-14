package com.koreait.hotelfive.command.reviewboard;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.ReplyDTO;
import com.koreait.hotelfive.dto.ReviewDTO;

public class ReviewBoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int rNo = Integer.parseInt(request.getParameter("rNo"));
		
		HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
		
		ArrayList<ReplyDTO> reList = hDAO.selectReviewBoardReply(rNo);
		ReviewDTO hDTO = hDAO.selectReviewBoardByrNo(rNo);
		model.addAttribute("hDTO", hDTO);
		model.addAttribute("reList", reList);
		
	}

}
