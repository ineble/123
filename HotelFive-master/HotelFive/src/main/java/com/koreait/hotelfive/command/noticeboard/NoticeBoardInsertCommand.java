package com.koreait.hotelfive.command.noticeboard;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.hotelfive.command.Command;
import com.koreait.hotelfive.dao.HotelFiveDAO;

public class NoticeBoardInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		RedirectAttributes rttr = (RedirectAttributes) map.get("rttr");
		
		int mNo = Integer.parseInt(mr.getParameter("mNo"));
		String nTitle = mr.getParameter("nTitle");
		String nContent = mr.getParameter("nContent");
		MultipartFile file = mr.getFile("file");
		MultipartFile imgFile = mr.getFile("imgFile");
		// 업로드 할 파일의 이름 / 확장자 분리하기 
		
		// 업로드 된 원래 파일명 (확장자 포함)
		String originFilename = file.getOriginalFilename();
		String originImgFilename = imgFile.getOriginalFilename();
		
		System.out.println(originFilename+","+originImgFilename);
		
		// 원래 파일명에서 확장자 분리 
		String fileExtName = originFilename.substring(originFilename.lastIndexOf(".") + 1);
		String imgFileExtName = originImgFilename.substring(originImgFilename.lastIndexOf(".") + 1);
		
		// 저장할 파일 이름 만들기 / 업로드 / 파일이름 DB에 저장
				
		String nFilename = "";
		String nImg = "";
	

				try {
						
						// 2) 업로드
						// 파일이 저장될 서버 내 경로 (/resources/assets/notice_files)를 알아낸다.
						String realPath = mr.getSession().getServletContext().getRealPath("/resources/assets/notice_files");
						
						// /resources/assets/notice_files경로가 존재하지 않으면 필요한 경로(디렉토리)를 만든다.
						File directory = new File(realPath);
						if ( !directory.exists() ) {
							directory.mkdirs();
						}
			
						if ( originFilename != "") {
							
								// 1) 저장할 파일 이름 만들기
								// 첨부파일
								nFilename = originFilename.substring(0, originFilename.lastIndexOf(".")) +
										"_" +
										System.currentTimeMillis() +
										"." + fileExtName;
			
								// 서버에 저장할 파일을 만든다.
								File saveFile = new File(realPath, nFilename);
								// 업로드
								file.transferTo(saveFile);
								
						}
						if ( originImgFilename != "") {
						
								// 이미지 파일
								nImg = originImgFilename.substring(0, originImgFilename.lastIndexOf(".")) +
									   "_" +
									   System.currentTimeMillis() +
									   "." + imgFileExtName;
								
								
								// 서버에 저장할 파일을 만든다.
								File saveImgFile = new File(realPath, nImg);
								
								// 업로드
								imgFile.transferTo(saveImgFile);
						}
						
						HotelFiveDAO hDAO = sqlSession.getMapper(HotelFiveDAO.class);
						rttr.addFlashAttribute("insertNoticeResult", hDAO.insertNoticeBoard(mNo, nTitle, nContent, nFilename, nImg));
						rttr.addFlashAttribute("beInserted", "true");
						
					
				} catch(Exception e) {
					e.printStackTrace();
				}
		
	}

}
