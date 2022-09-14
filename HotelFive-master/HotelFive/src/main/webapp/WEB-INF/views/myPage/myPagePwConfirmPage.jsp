<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호확인" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/assets/style/myPage/myPagePassword.css">
<style>
	.myPagePwConfirm-wrap{
		background-image: url("resources/assets/myMain_img/myMainBackground.jpg");
		height: 1200px;
	}
</style>
<script type="text/javascript">
	
	function fn_pwConfirm(f){
		var mPw = '${loginDTO.mPw}';
		
		  if( f.mPw.value == '' ){
			alert('비밀번호를 입력하세요');
			f.mPw.focus();
			return;
		}
		
		if( mPw != f.mPw.value ){
			alert('가입된 비밀번호와 일치하지 않습니다');
			f.mPw.focus();
			return;
		}
		
		if( mPw == f.mPw.value ){ 
			alert('인증완료 개인정보를 수정할 수 있는 페이지로 이동합니다');
			f.action = 'myUpdatePage';
			f.submit();
		}
	}
</script>

<div class="myPagePwConfirm-wrap">

		<form>
			<div class="centered">
				<h2>회원정보 변경</h2>
				<h4>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</h4>
			</div>
			
			<div class="idPw-input-wrap">
				<div>
					 <span style="color: black;">아이디</span> &nbsp;&nbsp; <span style="color: black; font-size: 25px; font-weight: bold">${loginDTO.mId}</span> &emsp;&emsp;&emsp; 
					<span style="color: black;">비밀번호 </span> &nbsp;&nbsp; <input type="password" name="mPw" ><br><br>
					<input class="gradient-btn" type="button" value="취소" onclick="location.href='goMyPage'">
					<input type="hidden" name="mId" value="${loginDTO.mId}">
					<input class="gradient-btn" type="button" value="인증하기" onclick="fn_pwConfirm(this.form)">
				</div>
			</div>
		</form>
</div>

	
	
	
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>