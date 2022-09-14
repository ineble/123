<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원상세보기" name="title"/>
</jsp:include>
]
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
	.centered{margin-top:200px;}
	.admin-view-box {
		width: 800px;
		margin: auto;
	}
	.admin-view-box table {
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	.admin-view-box table td {
		border: 1px solid black;
		padding: 5px;
	}
	.admin-view-box table tbody td:nth-of-type(1) { width: 300px; text-align: left;}
	.admin-view-box table tbody td:nth-of-type(2) { width: 100px; }
	.admin-view-box table tbody td:nth-of-type(3) { width: 100px; }
	.admin-view-box table tbody td:nth-of-type(4) { width: 70px; }
	.admin-view-box table tbody thead tr:nth-of-type(1) {
		text-align: center;
		font-weight: bold;
		background-color: teal;
	}
	
</style>
<script>
	function fn_memberLeave(f){
		if( confirm('정말 탈퇴할까요?') ){
			alert('회원이 탈퇴되었습니다');
			f.action = 'adminLeave';
			f.submit();
		}
		/* swal({
			  title: "정말 탈퇴할까요?",
			  text: "한번 탈퇴하면 다시 복구가 불가능 한 점 유의바랍니다",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
				  if (willDelete) {
				    swal("회원이 탈퇴되었습니다", {
				      icon: "success",
				    });
				    setTimeout(function(){
				    	 f.action = 'adminLeave';
						 f.submit();
				    }, 1500);
				     
				  } else {
				    swal("취소하였습니다");
				  }
		}); */
	}
	
	// 관리자 권한 부여
	function fn_adminMake(f){
		if( confirm('관리자 권한을 부여하시겠습니까?') ){
			alert('HotelFive의 관리자가 되었습니다!');
			f.action = 'adminMaking';
			f.submit();
		}
		/* swal({
			  title: "관리자 권한을 부여하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("HotelFive의 관리자가 되었습니다!", {
			      icon: "success",
			    });
			    setTimeout(function(){
			    	f.action = 'adminMaking';
					f.submit();
			    }, 1500);
			  } else {
			    swal("취소하였습니다");
			  }
		}); */
	}
	
	function fn_userMake(f){
		if( confirm('일반회원으로 권한을 부여하시겠습니까?') ){
			alert('HotelFive의 일반회원으로 변경되었습니다.');
			f.action = 'userMaking';
			f.submit();
		}
		/* swal({
			  title: "일반회원으로 권한을 부여하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("HotelFive의 일반회원으로 변경되었습니다.", {
			      icon: "success",
			    });
			    setTimeout(function(){
			    	f.action = 'userMaking';
					f.submit();
			    }, 1500);
			  } else {
			    swal("취소하였습니다");
			  }
		}); */
	}
</script>

<div class="container">
	<h1 class="centered">${hDAO.mId}님의 회원정보</h1><br>
	<br><br>
	<form>
		<table class="table table-hover">
			<tbody>
				<c:if test="${not empty hDAO }">
					<tr>
						<th>회원번호</th>
						<td>${hDAO.mNo }</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>${hDAO.mPw }</td>
					</tr>
					<tr>
						<th>성명</th>
						<td>${hDAO.mName }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${hDAO.mPhone }</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${hDAO.mZipcode }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${hDAO.mAddr1 }</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>${hDAO.mAddr2}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${hDAO.mRegDate}</td>
					</tr>
					<tr>
						<th>탈퇴여부</th>
						<td>
							<c:if test="${hDAO.mIsWithDrawal ne 1}">
								<span>비탈퇴</span>
							</c:if>
							
						</td>
					</tr>
					<tr>
						<th>권한</th>
						<td>
							<c:if test="${hDAO.mRight ne 0}">
								<span id="isAdmin">관리자</span>
							</c:if>
							<c:if test="${hDAO.mRight ne 1}">
								<span id="isUser">일반회원</span>
							</c:if>
						</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="11">
						<input type="hidden" name="mId" value="${hDAO.mId}"> <!-- request 전달 -->
						<input type="button" value="회원탈퇴시키기" class="btn btn-danger" onclick="fn_memberLeave(this.form)" />
						<input type="button" value="회원목록으로  이동" class="btn btn-success" onclick="location.href='adminList'" />
						<c:if test="${hDAO.mRight ne 1}">
							<input type="button" value="관리자 권한으로 승격" class="btn btn-primary" onclick="fn_adminMake(this.form)">			
						</c:if>
						<c:if test="${hDAO.mRight ne 0}">
							<input type="button" value="일반회원으로 강등" class="btn btn-danger" onclick="fn_userMake(this.form)">			
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>