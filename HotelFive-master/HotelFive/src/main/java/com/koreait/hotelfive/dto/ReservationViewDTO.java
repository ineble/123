package com.koreait.hotelfive.dto;

import java.sql.Date;

public class ReservationViewDTO {
	
	private int mNo, rNo, rPeople, rApproval;
	private String mId, mName, gName, mPhone, nmId, nmName, nmPhone;
	private Date rCheckIn, rCheckOut;
	
	public ReservationViewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReservationViewDTO(int mNo, int rNo, int rPeople, int rApproval, String mId, String mName, String gName,
			String mPhone, String nmId, String nmName, String nmPhone, Date rCheckIn, Date rCheckOut) {
		super();
		this.mNo = mNo;
		this.rNo = rNo;
		this.rPeople = rPeople;
		this.rApproval = rApproval;
		this.mId = mId;
		this.mName = mName;
		this.gName = gName;
		this.mPhone = mPhone;
		this.nmId = nmId;
		this.nmName = nmName;
		this.nmPhone = nmPhone;
		this.rCheckIn = rCheckIn;
		this.rCheckOut = rCheckOut;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	public int getrApproval() {
		return rApproval;
	}

	public void setrApproval(int rApproval) {
		this.rApproval = rApproval;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getNmId() {
		return nmId;
	}

	public void setNmId(String nmId) {
		this.nmId = nmId;
	}

	public String getNmName() {
		return nmName;
	}

	public void setNmName(String nmName) {
		this.nmName = nmName;
	}

	public String getNmPhone() {
		return nmPhone;
	}

	public void setNmPhone(String nmPhone) {
		this.nmPhone = nmPhone;
	}

	public Date getrCheckIn() {
		return rCheckIn;
	}

	public void setrCheckIn(Date rCheckIn) {
		this.rCheckIn = rCheckIn;
	}

	public Date getrCheckOut() {
		return rCheckOut;
	}

	public void setrCheckOut(Date rCheckOut) {
		this.rCheckOut = rCheckOut;
	}

	
	
}