<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
<!--
	.roomListOne {
		display: inline-block;
		padding: 40px;
	}
	img {
		width: 500px;
	}
	.roomListBox {
		padding-top: 50px;
		text-align: center;
	}
	.roomInfoLeft, .roomInfoRight {
		display: inline-block;
		padding: 5px;
	}
	.roomInfoLeft {
		text-align: left;
	}
	.roomInfoRight {
		text-align: right;
	}
	#line {
	    margin: auto;
	    color: gray;
	    width: 1400px;
	    border : 1px solid silver
    }
	.roomList_backimg {
		width: 100%; 
		height: 750px; 
		background-size: cover;
		background-image: url("resources/assets/background_img/hotel.jpg"); 
		text-align: center; 
		color: white; 
		padding-top: 300px;
	}
	#pagetitle {font-size: 85px; color: black;}
	#hotelfive, #explain {font-weight: bold; color: black;}
	#explain {font-size: 15px;}
	#roominfo {width: 200px;}
	#pagetitle, #hotelfive, #explain{
		text-shadow: 
		    1px -1px 0 #787878, 
		    -1px 1px 1px #808080, 
		    -2px 2px 1px #888888, 
		    -3px 3px 1px #909090, 
		    -4px 4px 1px #989898, 
		    -5px 5px 1px #a0a0a0, 
		    -6px 6px 1px #a8a8a8, 
		    -7px 7px 1px #b0b0b0, 
		    -8px 8px 1px #b8b8b8, 
		    -9px 9px 1px #c0c0c0, 
		    -10px 10px 1px #c8c8c8, 
		    -11px 11px 1px #d0d0d0
	}
-->
</style>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실소개" name="title"/>
</jsp:include>
	
	<!-- roomInfo 리스트 페이지  -->
	<div class="roomList_backimg">
		<h3 id="hotelfive">Hotel Five</h3>
		<h1 id="pagetitle">Preview Rooms</h1>
		<p id="explain">호텔파이브만의 감성을 추구하는 호텔파이브의 객실</p>
	</div>
	<div class="roomListBox">		
		<img id="roominfo" alt="roominfo" src="resources/assets/name_img/roominfo_name.png"/><br/><br/>
		<c:forEach var="gDTO" items="${list }" varStatus="k">
			<c:if test="${1 eq (gDTO.gNo % 2)}">
				<div class="roomListOne">
					<!-- RoomView(상세페이지)로 이동 -->
					<img usemap="#${k.index }"  alt="${gDTO.gName }" src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
					<map name="${k.index }">			
						<area href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}" shape="rect" coords="16, 276, 150, 318">
					</map>
					<!-- 방정보  -->
					<div class="roomInfoLeft">
						<h3>${gDTO.gName } Information</h3>
						${gDTO.gExplain}<br/>
						▶ 객실 크기 : ${gDTO.gRoomSize}평<br/>
						▶ 기준인원 : ${gDTO.gMinPeople}명<br/>
						▶ 최대인원 : ${gDTO.gMaxPeople}명<br/>
					</div>
				</div>
				<br/>
				<hr id="line"/>
			</c:if>
			
			<c:if test="${0 eq (gDTO.gNo % 2)}">
				<div class="roomListOne">
					<!-- 방정보  -->
					<div class="roomInfoRight">
						<h3>${gDTO.gName } Information</h3>
						${gDTO.gExplain}<br/>
						객실 크기 : ${gDTO.gRoomSize}평 ◀<br/>
						기준인원 : ${gDTO.gMinPeople}명 ◀<br/>
						최대인원 : ${gDTO.gMaxPeople}명 ◀<br/>
					</div>
					<!-- RoomView(상세페이지)로 이동 -->
					<img usemap="#${k.index }"  alt="${gDTO.gName }" src="resources/assets/guestroom_img/${gDTO.gThumbnail }.png">
					<map name="${k.index }">
						<area href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}" shape="rect" coords="16, 276, 150, 318">
					</map>
				</div>
				<br/>
				<hr id="line"/>			
			</c:if>
		</c:forEach>
	</div>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>