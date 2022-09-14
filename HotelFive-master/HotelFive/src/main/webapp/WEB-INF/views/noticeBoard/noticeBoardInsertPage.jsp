<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="공지사항" name="title"/>
</jsp:include>

<style type="text/css">
	.noticeInsertBox {width: 1100px; margin: 50px auto 50px; text-align: center;}
	.noticeInsertBox table {width:1000px; border: 2px solid lightgray; border-collapse: collapse; margin: 20px auto;}
	.noticeInsertBox table td {border: 1px solid lightgray; padding: 10px 20px;}
	.noticeInsertBox table td:nth-of-type(1) {width: 200px; background: #EAF2FF; font-weight: bold;}
	.noticeInsertBox table td:nth-of-type(2) {text-align: left;}
	.noticeInsertBox input[type=text] {padding:6px 10px; width: 700px; border: 1px solid lightgray;}
	.noticeInsertBox input[type=text]:hover, .noticeInsertBox input[type=text]:focus {outline: none; border-color: #353535}
	.noticeInsertBox span {display:inline-block;width: 200px;}
	.noticeInsertBox .noticeBtn {width: 190px; padding: 7px 10px; border: none; background-color: darkgray; color:white; margin-top: 30px;}
	.noticeInsertBox .noticeBtn:hover {outline: none; background-color: #353535;}
	.noticeInsertBox .noticeBtn:focus {outline: none;} 
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
	#writing_name {width: 200px;}
</style>
<script>
	
	function fn_submit(f){
		
		if(f.nTitle.value ==''){
			alert('제목을 작성해 주세요.');
			f.nTitle.focus();
		}else{
			f.submit();			
		}
		
	}

</script>
<div class="notice_backimg">
	<h3 id="hotelfive">Hotel Five</h3>
	<h1 id="pagetitle">Community</h1>
	<p id="explain">호텔파이브의 각종 이벤트 및 소식</p>
</div>

<div class="noticeInsertBox" >
	<img id="writing_name" alt="writing_name" src="resources/assets/name_img/writing_name1.png"/><br/>
	<form action="noticeBoardInsert" method="POST" enctype="multipart/form-data">
		<table class="name-title">
			<tr>
				<td>NAME</td>
				<td><input type="text" name="mId" value="${loginDTO.mId }" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>TITLE</td>
				<td><input type="text" name="nTitle" /></td>
			</tr> 
		</table>
		<table class="content">
			<tr>
				<td>CONTENT</td>
				<td><textarea name="nContent" rows="15" cols="100"></textarea></td>
			</tr>
		</table>
		<table class="file">
			<tr>
				<td>DATA</td>
				<td>
					<span>▶ 첨부파일 </span><input type="file" name="file" /><br/>
					<span>▶ 게시할 이미지 파일 </span><input type="file" name="imgFile" />				
				<br/>
		</table>
		<div class="btn">
			<input type="hidden" name="mNo" value="${loginDTO.mNo }"/>
			<input class="noticeBtn" type="button" value="LIST" onclick="location.href='noticeBoardListPage'" />
			<input class="noticeBtn" type="button" value="CANCEL" onclick="location.href='noticeBoardListPage'" />
			<input class="noticeBtn" type="button" value="SAVE" onclick="fn_submit(this.form)"/>
		</div>
	</form>
</div>


<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>