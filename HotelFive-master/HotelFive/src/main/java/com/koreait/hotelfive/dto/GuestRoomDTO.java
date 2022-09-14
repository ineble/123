package com.koreait.hotelfive.dto;

public class GuestRoomDTO {

   private int gNo, gPrice, gMinPeople, gMaxPeople, gRoomSize, gImgCount;
   private String gName, gExplain, gThumbnail;
   
   public GuestRoomDTO() {   }

   public GuestRoomDTO(int gNo, int gPrice, int gMinPeople, int gMaxPeople, int gRoomSize, int gImgCount, String gName,
         String gExplain, String gThumbnail) {
      super();
      this.gNo = gNo;
      this.gPrice = gPrice;
      this.gMinPeople = gMinPeople;
      this.gMaxPeople = gMaxPeople;
      this.gRoomSize = gRoomSize;
      this.gImgCount = gImgCount;
      this.gName = gName;
      this.gExplain = gExplain;
      this.gThumbnail = gThumbnail;
   }

   public int getgNo() {
      return gNo;
   }

   public void setgNo(int gNo) {
      this.gNo = gNo;
   }

   public int getgPrice() {
      return gPrice;
   }

   public void setgPrice(int gPrice) {
      this.gPrice = gPrice;
   }

   public int getgMinPeople() {
      return gMinPeople;
   }

   public void setgMinPeople(int gMinPeople) {
      this.gMinPeople = gMinPeople;
   }

   public int getgMaxPeople() {
      return gMaxPeople;
   }

   public void setgMaxPeople(int gMaxPeople) {
      this.gMaxPeople = gMaxPeople;
   }

   public int getgRoomSize() {
      return gRoomSize;
   }

   public void setgRoomSize(int gRoomSize) {
      this.gRoomSize = gRoomSize;
   }

   public int getgImgCount() {
      return gImgCount;
   }

   public void setgImgCount(int gImgCount) {
      this.gImgCount = gImgCount;
   }

   public String getgName() {
      return gName;
   }

   public void setgName(String gName) {
      this.gName = gName;
   }

   public String getgExplain() {
      return gExplain;
   }

   public void setgExplain(String gExplain) {
      this.gExplain = gExplain;
   }

   public String getgThumbnail() {
      return gThumbnail;
   }

   public void setgThumbnail(String gThumbnail) {
      this.gThumbnail = gThumbnail;
   }
   
   
   
}