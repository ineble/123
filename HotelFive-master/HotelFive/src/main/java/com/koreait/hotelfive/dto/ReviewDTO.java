package com.koreait.hotelfive.dto;

import java.sql.Date;

public class ReviewDTO {

		private int rNo, rRef, rStep, rDepth, rIsdelete;
		private String rTitle, rContent, rFilename, gName, mId;
		private Date rRegDate;
		private double rRating;
		
		public ReviewDTO() {  }

		public ReviewDTO(int rNo, int rRef, int rStep, int rDepth, int rIsdelete, String rTitle, String rContent, String rFilename, String gName, String mId, double rRating,
				Date rRegDate) {
			super();
			this.rNo = rNo;
			this.rRef = rRef;
			this.rStep = rStep;
			this.rDepth = rDepth;
			this.rIsdelete = rIsdelete;
			this.rTitle = rTitle;
			this.rContent = rContent;
			this.rFilename = rFilename;
			this.gName = gName;
			this.mId = mId;
			this.rRating = rRating;
			this.rRegDate = rRegDate;
		}

		public int getrNo() {
			return rNo;
		}

		public void setrNo(int rNo) {
			this.rNo = rNo;
		}

		public int getrRef() {
			return rRef;
		}

		public void setrRef(int rRef) {
			this.rRef = rRef;
		}

		public int getrStep() {
			return rStep;
		}

		public void setrStep(int rStep) {
			this.rStep = rStep;
		}

		public int getrDepth() {
			return rDepth;
		}

		public void setrDepth(int rDepth) {
			this.rDepth = rDepth;
		}
		
		public int getrIsdelete() {
			return rIsdelete;
		}

		public void setrIsdelete(int rIsdelete) {
			this.rIsdelete = rIsdelete;
		}

		public String getrTitle() {
			return rTitle;
		}

		public void setrTitle(String rTitle) {
			this.rTitle = rTitle;
		}

		public String getrContent() {
			return rContent;
		}

		public void setrContent(String rContent) {
			this.rContent = rContent;
		}

		public String getrFilename() {
			return rFilename;
		}

		public void setrFilename(String rFilename) {
			this.rFilename = rFilename;
		}
		
		public String getgName() {
			return gName;
		}

		public void setgName(String gName) {
			this.gName = gName;
		}

		public String getmId() {
			return mId;
		}

		public void setmId(String mId) {
			this.mId = mId;
		}

		public Date getrRegDate() {
			return rRegDate;
		}

		public void setrRegDate(Date rRegDate) {
			this.rRegDate = rRegDate;
		}

		public double getrRating() {
			return rRating;
		}

		public void setrRating(double rRating) {
			this.rRating = rRating;
		}
		
		
}
