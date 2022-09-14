<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />



<style type="text/css">
	.sign-up-box table {
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	.sign-up-box table td {
	
		padding: 5px;		
	}
	.sign-up-box table tbody td:first-of-type { width: 100px; }
	.sign-up-box table tbody td:last-of-type { text-align: left; }
	.sign-up-box table tfoot td {
		text-align: center;
	}
</style>


<div class="sign-up-box">
	
    <form id="f" method="POST" action='register'>
		<table>
			<tbody>
				<tr>
					<td>아이디<br/></td>
					<td>
						<input id="mId" type="text" name="mId" autocomplete="off" /><br/>
						<span id="idCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호<br/></td>
					<td>
						<input id="mPw" type="password" name="mPw" /><br/>
						<span id="pwCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호확인<br/></td>
					<td>
						<input id="mPw2" type="password" name="mPw2" /><br/>
						<span id="pwConfirmResult"></span>
					</td>
				</tr>
				<tr>
					<td>성명<br/></td>
					<td><input id="mName" type="text" name="mName" /></td>
				</tr>
				<tr>
					<td>이메일<br/></td>
					<td>
						<input id="mEmail" type="text" name="mEmail" /><br/>
						<span id="emailCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>전화번호<br/></td>
					<td>
						<input id="mPhone" type="text" name="mPhone" placeholder="하이픈입력" /><br/>
						<span id="phoneCheckResult"></span>
					</td>
				</tr>
				<tr>
					<td>주소<br/></td>
					<td><input id="mAddr" type="text" name="mAddr" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="submit" value="회원가입" />
						<input id="clearBtn" type="reset" value="입력취소" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>