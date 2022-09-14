package com.koreait.hotelfive.dto;

import java.sql.Date;

public class MemberDTO {

	private int mNo, mGrade, mPoint, mIsWithDrawal, mRight, mZipcode;
	private String mId, mPw, mName, mPhone, mAddr1, mAddr2,  mEmail;
	private Date mRegDate;
	
	public MemberDTO() {	}

	public MemberDTO(int mNo, int mGrade, int mPoint, int mIsWithDrawal, int mRight, int mZipcode, String mId,
			String mPw, String mName, String mPhone, String mAddr1, String mAddr2, String mEmail, Date mRegDate) {
		super();
		this.mNo = mNo;
		this.mGrade = mGrade;
		this.mPoint = mPoint;
		this.mIsWithDrawal = mIsWithDrawal;
		this.mRight = mRight;
		this.mZipcode = mZipcode;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mPhone = mPhone;
		this.mAddr1 = mAddr1;
		this.mAddr2 = mAddr2;
		this.mEmail = mEmail;
		this.mRegDate = mRegDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmGrade() {
		return mGrade;
	}

	public void setmGrade(int mGrade) {
		this.mGrade = mGrade;
	}

	public int getmPoint() {
		return mPoint;
	}

	public void setmPoint(int mPoint) {
		this.mPoint = mPoint;
	}

	public int getmIsWithDrawal() {
		return mIsWithDrawal;
	}

	public void setmIsWithDrawal(int mIsWithDrawal) {
		this.mIsWithDrawal = mIsWithDrawal;
	}

	public int getmRight() {
		return mRight;
	}

	public void setmRight(int mRight) {
		this.mRight = mRight;
	}

	public int getmZipcode() {
		return mZipcode;
	}

	public void setmZipcode(int mZipcode) {
		this.mZipcode = mZipcode;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddr1() {
		return mAddr1;
	}

	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}

	public String getmAddr2() {
		return mAddr2;
	}

	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public Date getmRegDate() {
		return mRegDate;
	}

	public void setmRegDate(Date mRegDate) {
		this.mRegDate = mRegDate;
	}

	
	
}