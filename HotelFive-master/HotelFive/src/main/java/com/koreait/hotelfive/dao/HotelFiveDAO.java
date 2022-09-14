package com.koreait.hotelfive.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.hotelfive.dto.GuestRoomDTO;
import com.koreait.hotelfive.dto.MemberDTO;
import com.koreait.hotelfive.dto.NoticeDTO;
import com.koreait.hotelfive.dto.QNADTO;
import com.koreait.hotelfive.dto.ReplyDTO;
import com.koreait.hotelfive.dto.ReservationDTO;
import com.koreait.hotelfive.dto.ReservationViewDTO;
import com.koreait.hotelfive.dto.ReviewDTO;

public interface HotelFiveDAO {
	
	//****************************************************************************************************************************************
	// 예약가능한 객실 리스트 검색
	public ArrayList<GuestRoomDTO> selectBookableList(String rCheckOut, String rCheckIn);

	public ArrayList<ReservationDTO> selectMyReservation(int mNo);
	
	public void reservationCancle(int rNo);
	
	public int insertReservation(int gNo, int mNo, int rApproval, int rPeople, int rPrice, String rCheckIn, String rCheckOut);
	
	public GuestRoomDTO selectGuestRoom(int gNo);
	
	public int insertReservation1(int gNo, int mNo, int rPeople, int rPrice, String rCheckIn, String rCheckOut);
	
	public int insertReservation2(int gNo, String nmId, int rPeople, int rPrice, String rCheckIn, String rCheckOut);
	
	public Integer confirmReservation(int gNo, String rCheckIn, String rCheckOut);
	
	// 비회원 
	public ArrayList<ReservationDTO> selectNonmemberReservation(String nmName, String nmPhone);
	
	public int selectNonmemberExistence(String nmPhone);
	
	public void insertNonMember(String nmName, String nmPhone);
	
	public String selectNmId(String nmPhone);
	
	
	
	//****************************************************************************************************************************************
	
	// registor 회원가입
	public void registor(MemberDTO mDTO);
	
	// 아이디 찾기 
	public MemberDTO findId(String mName, String mEmial);
	
	// 비밀번호 찾기 
	public MemberDTO findPw(String mId, String mEmail);
	
	// 비밀번호 변경
	public int changePw(String mPw, String mId);
	
	// 로그인
	public MemberDTO login(String mId, String mPw);

	// 아이디 중복체크
	public MemberDTO idCheck(String mId);
	
	// 이메일 중복체크
	public MemberDTO emailCheck(String mEmail);
	
	
	//****************************************************************************************************************************************
	
	// 객실정보 리스트
	// guestRoomList
	public ArrayList<GuestRoomDTO> guestRoomList();
		
	// 객실 상세정보 
	// guestRoomView
	public GuestRoomDTO guestRoomView(int gNo);
	
	public Double guestRoomRating(String gName);
	
	public int guestRoomRatingVote(String gName);
	//****************************************************************************************************************************************
	
	// qna 
	public ArrayList<QNADTO> selectQNABoard(Map<String, Integer> map);
	
	public int getTotalRecord();
	
	public QNADTO selectByqNo(int qNo);

	public void updateQNABoard(String qTitle, String qContent, int qNo);
	
	public void deleteQNABoard(int qNo);
	
	public int insertQNABoard1(String mId, String nmName, String qTitle, String qPw, String qContent, int qIsdelete);
	
	public int insertQNABoard2(String mId, String nmName, String qTitle, String qPw, String qContent, int qIsdelete);

	public int insertQNABoardReply(String mId, String reContent, int qNo);
	
	public ArrayList<ReplyDTO> selectQNABoardReply(int qNo);
	
	public void deleteQNABoardReply(int reNo);
	
	public void updateQNABoardReply(String updateReContent, int reNo);
	
	

	
	
	//*********************************************************************************************//
	// 신시명
	// review 
	//1. ReviewBoardInsert
	public void ReviewBoardInsert(String rTitle, String rContent, String mId, String saveFilename, double rRating, String gName, int rIsdelete);
	
	//2. selectReviewBoardList
	public ArrayList<ReviewDTO> selectReviewBoardList(Map<String, Integer> map);
	
	//2.5 getReviewTotalRecord
	public int getReviewTotalRecord();
	
	//3. selectReviewBoardByrNo(rNo)
	public ReviewDTO selectReviewBoardByrNo(int rNo);
	
	//4. deleteReviewBoardByrNo(rNo)
	public void deleteReviewBoardByrNo(int rNo);
	
	//5. updateReviewBoardByrNo(String rTitle, String rContent, String rFilename)
	public void updateReviewBoardByrNo(String rTitle, String rContent, String rFilename, double rRating, String gName, int rNo);
	
	//6. insertReviewBoardReply(String mId, String reContent, int rNo)
	public void insertReviewBoardReply(String mId, String reContent, int rNo);
	
	//7. selectReviewBoardReply(int rNo)
	public ArrayList<ReplyDTO> selectReviewBoardReply(int rNo);
	
	//8. deleteReviewBoardReplyByreNo(int reNo)
	public void deleteReviewBoardReplyByreNo(int reNo);
	
	//9. updateReviewBoardReply(int reNo)
	public void updateReviewBoardReply(String reContent, int reNo);

	//10. selectCheckReviewBoardList(Map map)
	public ArrayList<ReviewDTO> selectCheckReviewBoardList(Map<String, String> map);
	
	//10.5 getReviewTotalRecord()
	public int getReviewTotalCheckRecord(String gName);
	
	//**********************************************************************************************************************************************************	

		
	// notice
	// 1. selectNoticeBoardList
	public ArrayList<NoticeDTO> selectNoticeBoardList(Map<String, Integer> map);
	
	public int getTotalRecordNotice();
	
	// 2. insertNoticeBoard
	public int insertNoticeBoard(int mNo, String nTitle, String nContent, String nFilename, String nImg);
	
	// 3. selectNoticeBoardBynNo
	public NoticeDTO selectNoticeBoardBynNo(int nNo);
	
	// 4. deleteNoticeBoard
	public int deleteNoticeBoard(int nNo);
	
	// 5. updateNoticeBoardHit
		public void updateNoticeBoardHit(int nNo);
	
	
	//**********************************************************************************************************************************************************	
	
	//**********************************************************************************************************************************************************	
	// 이병한
	// 마이페이지 - 회원벙보 업데이트
	public void memberUpdate(MemberDTO mDTO);
	
	// ajax 를 이용한 mEmail 조회
	public MemberDTO selectBymEmail(String mEmail);
	
	//회원탈퇴(삭제)
	public void leaveMember(String mId);
	
	// 나의 질문글 보기
	public ArrayList<QNADTO> selectMyBoardList(Map<String, String> map);
//**********************************************************************************************************************************************************************
	
	// 관리자페이지 -- 전체 회원 리스트 조회
	public ArrayList<MemberDTO> userList(Map<String, Integer> map);
	// 관리자페이지 -- 전체 회원목록 글 갯수
	public int getTotalMember();
	
	// 관리자페이지 -- 회원 상세보기
	public MemberDTO selectBymNo(int mNo);
	
	// 관리자페이지 -- 회원 추가하기
	public void userInsert(MemberDTO mDTO);
	
	// 관리자페이지 -- 회원 탈퇴시키기
	public void userLeave(String mId);
	
	// 관리자페이지 -- 관리자 권한 부여하기
	public void changeAdmin(String mId);
	
	// 관리자페이지 -- 일반회원 권한 부여하기
	public void changeUser(String mId);
	
	// 관리자페이지 -- 회원검색하기 and 검색된 게시글 구하기
	public ArrayList<MemberDTO> queryAdminList(Map<String, String> map2);
	public int getQueryRecord(Map<String, String> map2);
	
	// 관리자페이지 -- 검색한 레코드 갯수만큼만 페이징
	public ArrayList<MemberDTO> queryAdminList2(Map<String, String> map2);
	public int getQueryRecord2(Map<String, String> map2);
	
	
	// 관리자페이지 -- 전체 예약 현황 - 예약 승인하기
	public void adminReservationOK(int rNo);
	
	// 관리자페이지 -- 전체 예약 현황 - 미승인 예약 취소하기
	public void adminReservationCancel(int rNo);
	
	// 관리자페이지 -- 전체 예약 현황 - 승인 예약 삭제하기
	public void adminReservationDelete(int rNo);
	
	// 관리자페이지 -- 전체 예약 현황  - 리스트 조회(예약테이블만 가져온다)
	public ArrayList<ReservationViewDTO> reservationList(Map<String, Integer> map2);
	
	public int getTotalReservationCount();
	// 관리자페이지 -- 전체 예약 현황 - 리스트 검색하기
	public ArrayList<ReservationViewDTO> queryAdminReservationList(Map<String, String> map2);

	public int getQueryReservationRecord(Map<String, String> map2);

	public ArrayList<ReservationViewDTO> nonMemberReservationList(Map<String, Integer> map2);

	public void deleteNonMemberReservationNumber(int rNo);

}
