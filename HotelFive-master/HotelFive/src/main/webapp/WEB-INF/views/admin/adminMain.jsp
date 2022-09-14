<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="::::: 관리자모드 :::::" name="title"/>
</jsp:include>

<style>
	.adminMain-wrap {
		height: 800px;
		background-color: #E2E2E2;
		padding-top: 300px; 
	}
	.group-btn{
		
		text-align: center;
	}
	.adminMainBtn{
		display: inline-block;
		padding: 15px 25px;
		font-size: 24px;
		cursor: pointer;
		text-align: center;
		text-decoration: none;
		outline: none;
		color: #fff;
		background-color: #4CAF50;
		border: none;
		border-radius: 15px;
		box-shadow: 0 9px #999;
		margin: 0 20px;
	}
	.adminMainBtn:hover {background-color: #3e8e41}

	.adminMainBtn:active {
	  background-color: #3e8e41;
	  box-shadow: 0 5px #666;
	  transform: translateY(4px);
	}
	#notice_name {width: 250px; margin-bottom: 70px;}
</style>

<br>

<div class="adminMain-wrap">
	
	<div class="group-btn">
		<input class="adminMainBtn" type="button" value="회원관리하기" onclick="location.href='adminList'">
		<input class="adminMainBtn" type="button" value="객실예약현황" onclick="location.href='adminReservationList'">
	</div>
	
</div>




<%@ include file="/WEB-INF/views/template/footer.jsp" %>