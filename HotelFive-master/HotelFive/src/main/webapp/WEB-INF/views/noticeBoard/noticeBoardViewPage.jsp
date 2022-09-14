<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>

<style type="text/css">
	.noticeViewBox {width: 1100px; margin-bottom: 50px; margin: 50px auto; text-align: center;}
	.noticeViewBox .headerTable, .contentTable {width:1000px; border: 2px solid lightgray; border-collapse: collapse; margin: 20px auto;}
	.noticeViewBox .headerTable td {border: 1px solid lightgray; padding: 10px 20px;}
	.noticeViewBox .headerTable tr td:nth-of-type(1) {width: 200px; font-weight: bold; background-color: #EAF2FF}
	.noticeViewBox .headerTable tr td:nth-of-type(3) {width: 200px; font-weight: bold; background-color: #EAF2FF}
	.noticeViewBox .headerTable tr td:nth-of-type(2) {text-align: left;}
	.noticeViewBox .headerTable tr td:nth-of-type(4) {width: 200px;}
	.noticeViewBox .contentTable td {padding: 30px 30px 10px 30px;}
	.noticeViewBox .contentTable tr:nth-of-type(2) td {text-align: left;}
	.noticeViewBox img {width: 100%}
	.notice_backimg {
		width: 100%; 
		height: 750px; 
		background-size: cover;
		background-image: url("resources/assets/background_img/backimg.jpg"); 
		text-align: center; 
		color: white; 
		padding-top: 300px;
	}
	.noticeViewBox .noticeviewBtn {width: 190px; padding: 7px 10px; border: none; background-color: darkgray; color:white; margin-top: 30px;}
	.noticeViewBox .noticeviewBtn:hover {outline: none; background-color: #353535;}
	.noticeViewBox .noticeviewBtn:focus {outline: none;} 
	.notice_backimg #pagetitle {font-size: 85px;}
	.notice_backimg #hotelfive, #explain {font-weight: bold;}
	.notice_backimg #explain {font-size: 15px;}
	#notice_name {width: 200px;}
</style>

<script type="text/javascript">

	var page = '${page}';
	
	$(document).ready(function () {
		$('#download_btn').click(function () {
			f.action = 'noticeViewFileDownload';
			f.submit();
		});
		
		$('#delete_btn').click(function () {
			if( confirm('이 게시글을 정말 삭제하시겠습니까?') ) {
				
				$.ajax({
					url : 'noticeBoardDelete',
					type: 'POST',
					dataType : 'json',
					data : 'nNo=' + $('#nNo').val(),
					success : function (data) {
								if(data.result == "YES"){
									alert('게시글이 정상적으로 삭제되었습니다.');
									location.href='noticeBoardListPage?page='+page;
								}
					},
					error : function () {
						alert('AJAX 통신이 실패했습니다.');
					}
				});
				
			}
			
		});
		
	});	
	
</script>

<div class="notice_backimg">
	<h3 id="hotelfive">Hotel Five</h3>
	<h1 id="pagetitle">Community</h1>
	<p id="explain">호텔파이브의 각종 이벤트 및 소식</p>
</div>

<div class="noticeViewBox">
	<img id="notice_name" alt="notice_name" src="resources/assets/name_img/notice_name1.png"/><br/> 
	<form id="f">
		<table class="headerTable">
			<tr>
				<td>NAME</td>
				<td>${nDTO.mId }</td>
				<td>NOTICEDATE</td>
				<td>${nDTO.nNoticeDate }
			</tr>
			<tr>
				<td>TITLE</td>
				<td colspan="3">${nDTO.nTitle }</td>
			</tr>
			<tr>
				<td>ATTACHED FILE</td>
				<td colspan="3"> 
					${nDTO.nFilename }&nbsp;&nbsp;
					<input type="hidden" name="nFilename" value="${nDTO.nFilename }" />
					<c:if test="${nDTO.nFilename ne null }">
						<i id="download_btn" class="fa fa-download" aria-hidden="true"></i>
					</c:if>
				</td>
			</tr>
		</table>
		<table class="contentTable">
			<tr>
				<td>
					<c:if test="${nDTO.nImg ne null }">
						<img alt="${nDTO.nImg}" src="${pageContext.request.contextPath}/resources/assets/notice_files/${nDTO.nImg}">
					</c:if>
				</td>
			</tr>
			<tr>
				<td>${nDTO.nContent }</td>
			</tr>
		</table>
		<div class="btn">
			<input id="nNo" type="hidden" name="nNo" value="${nDTO.nNo }"/>
			<input class="noticeviewBtn" type="button" value="LIST" onclick="location.href='noticeBoardListPage?page=${page}'" />
			<c:if test="${loginDTO.mRight eq 1 }">
				
				<input class="noticeviewBtn" id="delete_btn" type="button" value="DELETE"  />
				<input class="noticeviewBtn" type="button" value="WRITE" onclick="location.href='noticeBoardInsertPage'"/>
			</c:if>
		</div>
	</form>
</div>



<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>