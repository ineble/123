package com.koreait.hotelfive.dto;

import java.sql.Date;

public class ReplyDTO {
	
	private int reNo, qNo, rNo, reCategory;
	private String mId, reContent;
	private Date reNoticedate;
	
	public ReplyDTO() {}

	public ReplyDTO(int reNo, int qNo, int rNo, int mNo, int reCategory, String mId, String reContent, Date reNoticedate) {
		super();
		this.reNo = reNo;
		this.qNo = qNo;
		this.rNo = rNo;
		this.reCategory = reCategory;
		this.mId = mId;
		this.reContent = reContent;
		this.reNoticedate = reNoticedate;
	}

	public int getReNo() {
		return reNo;
	}

	public void setReNo(int reNo) {
		this.reNo = reNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	
	public int getReCategory() {
		return reCategory;
	}

	public void setReCategory(int reCategory) {
		this.reCategory = reCategory;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public Date getReNoticedate() {
		return reNoticedate;
	}

	public void setReNoticedate(Date reNoticedate) {
		this.reNoticedate = reNoticedate;
	}

	
}
