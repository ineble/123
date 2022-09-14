package com.koreait.hotelfive.dto;

import java.sql.Date;

public class NoticeDTO {
   
	private int nNo, nHit, mNo, nIsDelete;
	private String nTitle, nContent, nImg, nFilename, mId;
	private Date nNoticeDate;
   
   	public NoticeDTO() {   }
	public NoticeDTO(int nNo, int nHit, int mNo, int nIsDelete, String nTitle, String nContent, String nImg, String nFilename, String mId,
			Date nNoticeDate) {
		super();
		this.nNo = nNo;
		this.nHit = nHit;
		this.mNo = mNo;
		this.nIsDelete = nIsDelete;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nImg = nImg;
		this.nFilename = nFilename;
		this.mId = mId;
		this.nNoticeDate = nNoticeDate;
	}
	
	public int getnIsDelete() {
		return nIsDelete;
	}
	public void setnIsDelete(int nIsDelete) {
		this.nIsDelete = nIsDelete;
	}
	public String getmId() {
		return mId;
	}
	
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public int getnNo() {
	      return nNo;
	   }
	   public void setnNo(int nNo) {
	      this.nNo = nNo;
	   }
	   public int getnHit() {
	      return nHit;
	   }
	   public void setnHit(int nHit) {
	      this.nHit = nHit;
	   }
	   public int getmNo() {
	      return mNo;
	   }
	   public void setmNo(int mNo) {
	      this.mNo = mNo;
	   }
	   public String getnTitle() {
	      return nTitle;
	   }
	   public void setnTitle(String nTitle) {
	      this.nTitle = nTitle;
	   }
	   public String getnContent() {
	      return nContent;
	   }
	   public void setnContent(String nContent) {
	      this.nContent = nContent;
	   }
	   public String getnImg() {
	      return nImg;
	   }
	   public void setnImg(String nImg) {
	      this.nImg = nImg;
	   }
	   public String getnFilename() {
	      return nFilename;
	   }
	   public void setnFilename(String nFilename) {
	      this.nFilename = nFilename;
	   }
	   public Date getnNoticeDate() {
	      return nNoticeDate;
	   }
	   public void setnNoticeDate(Date nNoticeDate) {
	      this.nNoticeDate = nNoticeDate;
	   }
	   
	   
   
}