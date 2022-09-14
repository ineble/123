<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	function fn_checkReview(f) {
		f.action = 'checkReviewBoard';
		f.submit(f);
	}
	
</script>

<style>
<!--
	*{margin:0;padding:0;}
    .roomViewBox ul,li{list-style:none;}
    .roomViewBox li{text-align: center;}
    .slide{width:100%; height:960px; overflow:hidden; position:relative;}
    .slide li{position:absolute; left:0; right:0; top:0; bottom:0; opacity:0; transition:1s;}
    .slide input{display:none;}
    .slide .bullet{position:absolute; bottom:20px; left:0; right:0; text-align:center; z-index:2;}
    .slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}

    /* 슬라이드 조작 */
    #pos1:checked ~ ul li:nth-child(1),
    #pos2:checked ~ ul li:nth-child(2),
    #pos3:checked ~ ul li:nth-child(3),
    #pos4:checked ~ ul li:nth-child(4){opacity:1;}

    /* bullet 조작 */ 
    #pos1:checked ~ .bullet label:nth-child(1),
    #pos2:checked ~ .bullet label:nth-child(2),
    #pos3:checked ~ .bullet label:nth-child(3),
    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}
    
    .roomViewBox { text-align: center; margin-bottom: 60px;}
    .roomSelectBox { margin-bottom:30px;}
    
    .roomInfoTable { margin: 10px auto; border-collapse: collapse; }
    .refund-table {border-collapse: collapse;}
    .refund-table tr td:nth-of-type(2) {color: red;}
    
    .roomViewBox table, td { border: 1px solid black; padding: 10px;}
    .roomViewBox tr > td:nth-of-type(1) { text-align: center; font-weight: bold;}
    .roomViewBox .roomSelectBox input[type=button] {
    	width: 150px;
    	padding: 10px 0;
    	margin: 0;
    	border: none;
    	background: #E3EAF3;
    }
    .roomViewBox .roomSelectBox input[type=button]:hover { background: #A4CAED; }
    .roomViewBox .roomSelectBox input[type=button]:focus { outline: none; }
    .roomViewBox #explain {color: gray;}
    .roomViewBox #a {font-weight: bold;}
    .roomViewBox .icon {display: inline-block; margin-left: 30px;}
    
    .roomViewBox #reviewBtn {margin-top: 20px; padding: 10px; width: 300px; background-color: darkgray; color: white; font-weight: bold; border: none;}
   	.roomViewBox #reviewBtn:hover {background-color: #353535; outline: none;} 
    
    #roomViewImg {width: 100%;}
    #line { color: gray; 
    	margin: auto;
	    color: gray;
	    width: 1400px;
	    border : 1px solid silver}
    
-->
</style>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실소개" name="title"/>
</jsp:include>
	 
	<!-- 객실 상세정보 페이지 -->
	<div class="roomViewBox">
		
		
		<div class="slide">
		    <input type="radio" name="pos" id="pos1" checked>
		    <input type="radio" name="pos" id="pos2">
		    <input type="radio" name="pos" id="pos3">
		    <input type="radio" name="pos" id="pos4">
		    <ul>
		    	<c:forEach var="imgCount" begin="1" end="${gDTO.gImgCount }">    	
			    	<li><img id="roomViewImg" alt="${gDTO.gName }_${imgCount}" src="resources/assets/guestroom_img/${gDTO.gName }_${imgCount}.jpg"></li>
		    	</c:forEach>
	
		    </ul>
		    <p class="bullet">
		      	<label for="pos1">1</label>
		      	<label for="pos2">2</label>
		      	<label for="pos3">3</label>
		      	<label for="pos4">4</label>
		    </p>
		</div>	
	
		<form method="GET">	
			<h1>${gDTO.gName }</h1>
			<p id="a">평점: ${Rating } / 5.0 (참여인원: ${Vote }명)</p>
			<p id="explain">${gDTO.gExplain}</p> <br/><br/>
			<div class="roomSelectBox">
				<input type="button" value="A101" onclick="location.href='roomViewPage?gNo=1&gName=A101'"/>
				<input type="button" value="A102" onclick="location.href='roomViewPage?gNo=2&gName=A102'"/>
				<input type="button" value="B201" onclick="location.href='roomViewPage?gNo=3&gName=B201'"/>
				<input type="button" value="B202" onclick="location.href='roomViewPage?gNo=4&gName=B202'"/>
				<input type="button" value="C301" onclick="location.href='roomViewPage?gNo=5&gName=C301'"/>
			</div>
			<hr id="line"/>			
				<table class="roomInfoTable">
					<tr>
						<td colspan="2">
							<div class="icon"><i class="fas fa-mug-hot fa-2x"></i><br/>커피/티</div>
							<div class="icon"><i class="fas fa-tint fa-2x"></i><br/>생수</div> 
							<div class="icon"><i class="fab fa-usb fa-2x"></i><br/>USB충전단자</div>
							<div class="icon"><i class="fas fa-snowflake fa-2x"></i>/<i class="fas fa-fire-alt fa-2x"></i><br/>개별냉난방</div>
							<div class="icon"><i class="fas fa-bed fa-2x"></i><br/>침대</div>
							<div class="icon"><i class="fas fa-wifi fa-2x"></i><br/>무료WIFI</div> <br/><br/>
							<div class="icon"><i class="fas fa-thermometer-three-quarters fa-2x"></i><br/>객실 내 온도 조절기</div>
							<div class="icon"><i class="fas fa-umbrella-beach fa-2x"></i><br/>발코니</div>
							<div class="icon"><i class="fas fa-bath fa-2x"></i><br/>욕조</div>
							<div class="icon"><i class="fas fa-utensils fa-2x"></i><br/>취사가능</div>
							<div class="icon"><i class="fas fa-coffee fa-2x"></i><br/>커피포트</div>
							<div class="icon"><i class="fas fa-wind fa-2x"></i><br/>드라이기</div>		
						</td>
					</tr>
					<tr>
						<td>
							ROOM QUICKVIEW
						</td>
						<td>
							▶  객실 크기 : ${gDTO.gRoomSize}평 <br/>
							▶ 객실 당 인원 : 기준 인원 ${gDTO.gMinPeople}명 / 최대 인원 ${gDTO.gMaxPeople}명<br/>
							&nbsp;&nbsp;※ 기준인원 초과시 1인당 성인 20,000원 추가발생 ※<br/> 
						</td>
					</tr>
					<tr>
						<td>
							SERVICE & BENEFIT
						</td>
						<td>
							▶ 체크인 (입실) 15:00 이후 / 체크아웃 (퇴실) : 11:00 이전 <br/>
							▶ [안내사항] 늦은 퇴실 또는 빠른 입실시 다음의 추가요금이 부과됩니다. <br/>
							▶ 늦은 퇴실시 부과요금 (Late CheckOut)<br/>
							&nbsp;&nbsp;※ 11시 ~ 12시 퇴실시 : 무료이용<br/>
							&nbsp;&nbsp;※ 12시 ~ 17시 퇴실시 : 시간 상관없이 50,000원 부과<br/>
							&nbsp;&nbsp;※ 17시 이후 퇴실시 : 당일 요금의 100% 부과<br/>
							▶ 빠른 입실시 부과요금 (Early CheckIn)<br/>
							&nbsp;&nbsp;※ 호텔 상황에 따라 유동적일 수 있음<br/>
							▶ 전 객실 금연 <br/>
							▶ 필요한 물품(수건, 생수, 휴지 등)은 프론트에서 교체 제공해 드리고 있으니 이용에 참고하시기 바랍니다.<br/>
						</td>
					</tr>
					<tr>
						<td>
							RESERVATION & <br/>
							CANCELLATION
						</td>
						<td>
							▶ 예약문의 : 02-123-4567<br/>
							▶ E-mail : hotelfive@koreait.com<br/>
							▶ 취소/환불 규정
							&nbsp;* 비수기/연휴/성수기 공통 
							<table class="refund-table">
								<tr>
									<td>체크인 15일 이전 취소</td>
									<td>90% 환불</td>
								</tr>
								<tr>
									<td>체크인 10일 이전 취소</td>
									<td>80% 환불</td>
								</tr>
								<tr>
									<td>체크인 7일 이전 취소</td>
									<td>60% 환불</td>
								</tr>
								<tr>
									<td>체크인 4일 이전 취소</td>
									<td>30% 환불</td>
								</tr>
								<tr>
									<td>체크인 3일전 ~ 당일취소</td>
									<td>환불 불가</td>
								</tr>
							</table>
							&nbsp;* 체크인 시간 기준 : 당일 15시 입실 기준
						</td>
					</tr>
				</table>
				
			<input type="hidden" value="${gDTO.gName }" name="gName"/>
			<input id=reviewBtn type="button" value="이용후기 보기" onclick="fn_checkReview(this.form)"/>
			
		</form>
		
	</div> 
	 

</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>