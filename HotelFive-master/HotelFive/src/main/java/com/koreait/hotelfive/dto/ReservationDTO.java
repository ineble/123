package com.koreait.hotelfive.dto;

import java.sql.Date;

public class ReservationDTO {

	private int rNo, gNo, mNo, rApproval, rPeople, rPrice ;
	private Date rCheckIn, rCheckOut;
	private String gName, nmId;
	
	public ReservationDTO() {	}

	public ReservationDTO(int rNo, int gNo, int mNo, int rApproval, int rPeople, int rPrice, Date rCheckIn,
			Date rCheckOut, String gName, String nmId) {
		super();
		this.rNo = rNo;
		this.gNo = gNo;
		this.mNo = mNo;
		this.rApproval = rApproval;
		this.rPeople = rPeople;
		this.rPrice = rPrice;
		this.rCheckIn = rCheckIn;
		this.rCheckOut = rCheckOut;
		this.gName = gName;
		this.nmId = nmId;
	}

	public String getNmId() {
		return nmId;
	}

	public void setNmId(String nmId) {
		this.nmId = nmId;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getgNo() {
		return gNo;
	}

	public void setgNo(int gNo) {
		this.gNo = gNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getrApproval() {
		return rApproval;
	}

	public void setrApproval(int rApproval) {
		this.rApproval = rApproval;
	}

	public int getrPeople() {
		return rPeople;
	}

	public void setrPeople(int rPeople) {
		this.rPeople = rPeople;
	}

	public int getrPrice() {
		return rPrice;
	}

	public void setrPrice(int rPrice) {
		this.rPrice = rPrice;
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

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	
	
	
}
