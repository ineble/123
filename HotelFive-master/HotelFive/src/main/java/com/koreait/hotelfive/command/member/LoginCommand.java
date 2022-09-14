package com.koreait.hotelfive.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;
import com.koreait.hotelfive.dto.MemberDTO;

public class LoginCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes) map.get("rttr");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String mId = request.getParameter("login_mId");
		String mPw = request.getParameter("login_mPw");
		
		HotelFiveDAO hDAO =  sqlSession.getMapper(HotelFiveDAO.class);
		MemberDTO mDTO = hDAO.login(mId, mPw);
		
		if(mDTO != null) {
			if (mDTO.getmIsWithDrawal() != 0) {
				rttr.addFlashAttribute("beDeleted", 1);
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("loginDTO", mDTO);
				rttr.addFlashAttribute("loginResult", 1);	
			}
		}
			rttr.addFlashAttribute("beLogined", 1);
	}

}
