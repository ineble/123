<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.*"  %>

<style>

  .bookableList_backimg {
			width: 100%; 
			height: 750px;  
			background-size: cover;
			background-image: url("resources/assets/background_img/clock-691143_640.jpg"); 
			text-align: center; 
			color: white; 
			padding-top: 300px;
	}
		#pagetitle {font-size: 85px;}
		#hotelfive, #explain {font-weight: bold;}
		#explain {font-size: 15px;}

   .nonMemberResrevationBox{
      width: 1100px; 
      margin-bottom: 100px; 
      margin: 50px auto; 
   }
   .nonMemberResrevationBox h2{
      text-align: center;
      color: #AAAAAA;
   }
   .nonMemberResrevationBox table{margin: auto; border-collapse: collapse; width: 1100px;}
   .nonMemberResrevationBox thead th {background: #DAE2F0; padding: 10px;}
   .nonMemberResrevationBox td {text-align: center; padding:10px; border: 1px solid lightgray;}
   .nonMemberResrevationBox tr td:nth-of-type(1) {width: 100px;}
   .nonMemberResrevationBox tr td:nth-of-type(2) {width: 200px;}
   .nonMemberResrevationBox tr td:nth-of-type(3) {width: 550px;}
   .nonMemberResrevationBox tr td:nth-of-type(4) {width: 250px;}
   .nonMemberResrevationBox tbody input {
      border: none;
	    /* margin: auto; */
	    /* text-align: center; */
	    width: 50%;
	    height: 50px;
	    font-weight: bold;
   }
   .nonMemberResrevationBox tbody tr td{
      border: none;
   }
</style>
<script>
   function fn_reservationCancle(f){
      
      if(confirm('예약을 취소하시겠습니까?')){
         f.action = "nonMemberReservationCancle";
         f.submit();
      }
   }
</script>
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />
   
   		<div class="bookableList_backimg">
		<h3 id="hotelfive">Hotel Five</h3>
		<h1 id="pagetitle">Reservation check</h1>
		<p id="explain">좋은 시간을 보낼 호텔파이브 비회원 예약조회</p>
		</div>
 
   
   
   <div class="nonMemberResrevationBox">
      <h2>${nmName } 님 예약내역</h2>
      <table>
         <thead>
            <tr>
               <th>예약번호</th>
               <th>객실명</th>
               <th>숙박기간</th>
               <th>예약상태</th>
            </tr>
         </thead>
         <tbody>
            <c:if test="${empty list }">
               <tr>
                  <td colspan="4">
                     예약이 없습니다.
                  </td>
               </tr>
            </c:if>
            <c:if test="${not empty list }">
               <c:forEach var="rDTO" items="${list }">
                  <form>
                     <tr>
                        <td>${rDTO.rNo }</td>
                        <td>${rDTO.gName}</td>
                        <td>${rDTO.rCheckIn } ~ ${rDTO.rCheckOut }</td>
                        <c:if test="${rDTO.rApproval eq 0 }">
                           <td>
                              <label>승인대기</label>
                              <input type="button" value="예약취소" onclick="fn_reservationCancle(this.form)">
                              <input type="hidden" name="rNo" value="${rDTO.rNo }"/> 
                              <input type="hidden" name="nmId" value="${rDTO.nmId }"/>
                           </td>
                        </c:if>
                        <c:if test="${rDTO.rApproval eq 1 }">
                           <td>
                              <label>승인완료</label>
                            <!--   <input type="button" value="예약취소" disabled="disabled"/> -->
                           </td>
                        </c:if>
                     </tr>
                  </form>
               </c:forEach>
            </c:if>
         </tbody>
      </table>
   </div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>