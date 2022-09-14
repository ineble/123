<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	
/* 	.main{
		background-image: url(resources/main.jpg);
		height: 800px;	
	} */
	
   #myVideo {
     position: fixed;
     right: 0;
      bottom: 0;
     min-width: 100%;
     min-height: 100%;
   }
	
	.reservation-box {
		position: fixed;
		display:inline-block;
		margin: 200px 0 0 100px;
		border : 1px solid black;
		background : black;
	}
	.reservation-box-form{
		background : white;
		display: flex;
	}
	
   .footer-wrap {
      position: fixed;
      bottom: 0;
   }
   
	#reservation-box-checkIn{
		border : none;
	}
   #reservation-box-checkOut{
   	border : none;
   }
   #reservation-box-selectBnt{
   border : none;
   }
	
</style>
<script>
	
	var today = new Date();
  function fn_selectReservation(f){
	  
	  if (f.rCheckIn.value > f.rCheckOut.value ){
		  alert('입실 날짜보다 퇴실날짜가 빠를 수 없습니다.');
		  f.rCheckOut.focus();
	  }else if(new Date(f.rCheckIn.value) < today ){
		  alert('지날 날짜와 당일 예약은 불가능합니다.');
		  f.rCheckIn.focus();
	  }else
	  {
		  f.action="selectBookable";
		  f.submit();
	  }
	  
  }
</script>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />

<video autoplay muted loop id="myVideo">
  <source src="resources/Sea.mp4" type="video/mp4">
</video>


<div class="main">
	<div class="reservation-box">
		<form class="reservation-box-form">
			<div id = "reservation-box-checkIn-div">
			체크인
			<input id="reservation-box-checkIn" type="date" name="rCheckIn" />
			</div>
			<div id = "reservation-box-checkOutn-div">
			체크아웃
			<input id="reservation-box-checkOut"type="date" name="rCheckOut"/>
			</div>
			<div id = "reservation-box-selectBtn-div">
			<input id="reservation-box-selectBtn" type="button" value="객실검색" onclick="fn_selectReservation(this.form)">
			</div>
		</form>
	</div>

</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>