package com.koreait.hotelfive.dto;

import java.sql.Date;

public class QNADTO {
	
	private int qNo, qRef, qStep, qDepth, qIsdelete, count;
	private String qTitle, mId, nmName, qContent, qPw;
	private Date qNoticedate;
	
	public QNADTO() {}

	public QNADTO(int qNo, int qRef, int qStep, int qDepth, int qIsdelete, int count, String qTitle, String mId,
			String nmName, String qContent, String qPw, Date qNoticedate) {
		super();
		this.qNo = qNo;
		this.qRef = qRef;
		this.qStep = qStep;
		this.qDepth = qDepth;
		this.qIsdelete = qIsdelete;
		this.count = count;
		this.qTitle = qTitle;
		this.mId = mId;
		this.nmName = nmName;
		this.qContent = qContent;
		this.qPw = qPw;
		this.qNoticedate = qNoticedate;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getqRef() {
		return qRef;
	}

	public void setqRef(int qRef) {
		this.qRef = qRef;
	}

	public int getqStep() {
		return qStep;
	}

	public void setqStep(int qStep) {
		this.qStep = qStep;
	}

	public int getqDepth() {
		return qDepth;
	}

	public void setqDepth(int qDepth) {
		this.qDepth = qDepth;
	}

	public int getqIsdelete() {
		return qIsdelete;
	}

	public void setqIsdelete(int qIsdelete) {
		this.qIsdelete = qIsdelete;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getNmName() {
		return nmName;
	}

	public void setNmName(String nmName) {
		this.nmName = nmName;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqPw() {
		return qPw;
	}

	public void setqPw(String qPw) {
		this.qPw = qPw;
	}

	public Date getqNoticedate() {
		return qNoticedate;
	}

	public void setqNoticedate(Date qNoticedate) {
		this.qNoticedate = qNoticedate;
	}

	

}
