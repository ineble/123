package com.koreait.hotelfive.dto;

public class NonMemberDTO {
	
	String nmId, nmName, nmPhone;
	
	public NonMemberDTO() {}

	public NonMemberDTO(String nmId, String nmName, String nmPhone) {
		super();
		this.nmId = nmId;
		this.nmName = nmName;
		this.nmPhone = nmPhone;
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
	
	
	
}
