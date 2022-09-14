<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>

<style type="text/css">

	.noticeListBox {width: 1100px; margin-bottom: 50px; margin: 50px auto; text-align: center;}
	.noticeListBox table{margin:auto; border-collapse: collapse;width: 1100px;}
	.noticeListBox thead td {background: #EAF2FF;}
	.noticeListBox td {text-align: center; padding:10px;border-bottom: 1px solid lightgray;}
	.noticeListBox tr td:nth-of-type(1) {width: 100px;}
	.noticeListBox tr td:nth-of-type(2) {width: 500px;}
	.noticeListBox tr td:nth-of-type(3) {width: 150px;}
	.noticeListBox tr td:nth-of-type(4) {width: 150px;}
	.noticeListBox tr td:nth-of-type(5) {width: 100px;}
	.noticeListBox .noticeInsertBtn {float: right; margin-bottom: 10px; text-decoration: none;}
	.notice_backimg {
		width: 100%; 
		height: 750px; 
		background-size: cover;
		background-image: url("resources/assets/background_img/backimg.jpg"); 
		text-align: center; 
		color: white; 
		padding-top: 300px;
	}
	
	.notice_backimg #pagetitle {font-size: 85px;}
	.notice_backimg #hotelfive, #explain {font-weight: bold;}
	.notice_backimg #explain {font-size: 15px;}
	#notice_name {width: 200px;}
</style>

<script type="text/javascript">
	var beInserted = '${beInserted}';
	if (beInserted == 'true') {
		var insertNoticeResult = '${insertNoticeResult}';
		if (insertNoticeResult == 1) {
			alert('삽입성공');
		} else {
			alert('삽입실패');
		}
	}
</script>

<div class="notice_backimg">
	<h3 id="hotelfive">Hotel Five</h3>
	<h1 id="pagetitle">Community</h1>
	<p id="explain">호텔파이브의 각종 이벤트 및 소식</p>
</div>

<div class="noticeListBox">
	<img id="notice_name" alt="notice_name" src="resources/assets/name_img/notice_name1.png"/><br/> 
	<c:if test="${loginDTO.mRight eq 1 }">
		<a class="noticeInsertBtn" href='noticeBoardInsertPage'><i class="fas fa-user-edit fa-2x"></i>게시물 작성</a><br/>
	</c:if>
	<table>
		<thead>
			<tr>
				<td>NO</td>
				<td>TITLE</td>
				<td>NAME</td>
				<td>DATE</td>
				<td>HIT</td>
			</tr>	
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">등록된 공지사항이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="nDTO" items="${list }">
					<tr>
						<c:if test="${nDTO.nIsDelete eq 0 }">
							<td>${nDTO.nNo }</td>
							<td><a href="noticeBoardViewPage?nNo=${nDTO.nNo}&page=${page}" >${nDTO.nTitle }</a></td>
							<td>${nDTO.mId }</td>
							<td>${nDTO.nNoticeDate }</td>
							<td>${nDTO.nHit }</td>
						</c:if>
						<c:if test="${nDTO.nIsDelete eq 1 }">
							<td>${nDTO.nNo }</td>
							<td colspan="4">관리자에 의해 삭제된 게시글 입니다.</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">${pageView }</td>
			</tr>
	</table>
</div>


<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>