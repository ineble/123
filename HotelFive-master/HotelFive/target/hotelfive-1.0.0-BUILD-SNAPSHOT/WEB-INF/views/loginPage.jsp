<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />


<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->
<c:if test="${loginDTO.mId == 'admin' }">
	회원관리<br/>
	게시글관리<br/>
</c:if>



<style type="text/css">
	.login-box table {
		border-collapse: collapse;
		width: 400px;
		margin: auto;
	}
	.login-box table td {
		border: 1px solid black;
		padding: 5px;		
	}
	.login-box table tfoot {
		text-align: center;
	}
</style>

<script type="text/javascript">
	
	

	
	function fn_login(f) {
		f.action = 'login';
		f.submit();
	}
	
	// 1. 쿠키 만들기
	function setCookie( cookieName, value, exdays ) {
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}

	// 2. 쿠키 삭제
	function deleteCookie( cookieName ) {
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}

	// 3. 쿠키 가져오기
	function getCookie( cookieName ) {
	    cookieName = cookieName + "=";
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = "";
	    if ( start != -1 ){
	        start += cookieName.length;
	        var end = cookieData.indexOf(";", start);
	        if(end == -1) {
	            end = cookieData.length;
	        }
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	
</script>


<div class="login-box">
	<form method="POST">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input id="mId" type="text" name="mId" autofocus /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mPw" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="로그인" onclick="fn_login(this.form)" />
						&nbsp;&nbsp;
						<input id="saveIDCheck" type="checkbox" name="saveIDCheck" value="true" checked />아이디 기억하기
						<br/><br/>
						<a href="findIdPage">아이디 찾기</a>
						&nbsp;&nbsp;
						<a href="findPwPage">비밀번호 찾기</a><br/>
						<a href="findReservationNumber">비회원 예약확인</a><br/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>





<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>