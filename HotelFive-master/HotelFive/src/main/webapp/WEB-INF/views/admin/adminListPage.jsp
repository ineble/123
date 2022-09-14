<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="관리자용" name="title"/>
</jsp:include>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
	.container {
		width: 70%;
		height: 700px;
	}
	
	.queryBtn {
	  width: 70px;
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 7px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  cursor: pointer;
	  border-radius: 4px;
	}
	tr, th {text-align: center;}
	select {
	  width: 140px;
	  padding: .6em .3em;
	  font-family: inherit;
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border: 1px solid #999;
	  border-radius: 0px;
	}
	select::-ms-expand {
	  /* for IE 11 */
	  display: none;
	}
	.queryInput{
		height: 40px;
		border-radius: 3px;
	}
	
	.Btn{ /* 버튼 : 회원추가, 전체회원 리스트 */
		
		background-color: #4CAF50; /* Green */
		border: none;
		color: white;
		padding: 10px 24px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		transition-duration: 0.4s;
		cursor: pointer;
	}
	.btnAdd, .btnTotalList {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #4CAF50;
	}
	.btnAdd:hover, .btnTotalList:hover {
	  background-color: #4CAF50;
	  color: white;
	}
	 
</style>
<script type="text/javascript">
	
	// 검색 결과 보기
	function fn_queryAdminList(f){
		
		if(f.query.value == ''){
			//swal("검색할 입력은 필수입니다","", 'error');
			alert('검색할 입력은 필수입니다');
			f.query.focus();
			return;
		}
		if(f.column.value == 'EMPTY' && f.query.value != ''){
			//swal("검색할 카테고리를 지정해주세요","", 'error');
			alert('검색할 카테고리를 지정해주세요');
			f.column.focus();
			return;
		} 
		f.action = 'queryAdminListPage';
		f.submit();
	}
	
	function fn_insertMember(){
		if( confirm('회원가입 페이지로 이동합니다. 이동하시겠습니까?') ){
			location.href = 'adminInsertPage';
		}
		/* swal({
			  title: "회원가입 페이지로 이동합니다. 이동하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("회원가입 페이지로 이동합니다.", {
			      icon: "success",
			    });
			    setTimeout(function(){
			    	location.href = 'adminRegisterPage';
			    }, 1500);
			  } else {
			    swal("취소하였습니다");
			  }
			}); */
		
		/* if( confirm('회원가입 페이지로 이동합니다. 이동하시겠습니까?') ){
			location.href = 'adminInsertPage';
		} else {
			return;
		} */
	}
	
	
	
</script>
<br><br><br><br><br><br><br><br><br>
<div class="container">
	<h1 class="text-center">회원목록</h1><br>
	
	<div class="text-center">전체 ${totalRecord} 개</div>
	<form class="text-right">
		
		<!-- 새로운 회원 추가하기 -->
		<c:if test="${loginDTO ne null }">
			<input class="Btn btnAdd" type="button" value="회원 추가하기" onclick="fn_insertMember()" />
		</c:if>
			<c:if test="${page le 2}">
				<input type="hidden" name="page" value="${page }">
			</c:if>
			<input class="Btn btnTotalList" type="button" value="전체 게시글 보기" onclick="location.href='adminList'" />
	</form>
	
	<br>
	<table class="table table-hover">
		<thead>
			<tr class="text-center">
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>이메일</th>
				<th>권한</th>
				
			</tr>
		</thead>
		<tbody class="search row">
			
			<c:choose>
			
				<c:when test="${empty list }">
					<tr>
						<td colspan="9">회원이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:when test="${not empty list }">
					<c:forEach var="mDTO" items="${list }">
						<!-- 관리자 또는 일반 상관없이 탈퇴자 -->
						<c:if test="${mDTO.mIsWithDrawal eq 1 }">
								<tr>
									<td>${mDTO.mNo }</td>
									<td>${mDTO.mId }</td>
									<td colspan="8">탈퇴된 회원입니다.</td>
								</tr>
						</c:if>
						<!-- 비탈퇴이면서 관리자이다. -->
						<c:if test="${mDTO.mIsWithDrawal ne 1 and mDTO.mRight ne 0}">
								<tr>
									<td>${mDTO.mNo }</td>
									<td><a href="adminViewPage?mNo=${mDTO.mNo }">${mDTO.mId }</a></td>
									<td>${mDTO.mName }</td>
									<td>${mDTO.mPhone }</td>
									<td>${mDTO.mZipcode }</td>
									<td>${mDTO.mAddr1 }</td>
									<td>${mDTO.mAddr2}</td>
									<td>${mDTO.mEmail}</td>
									<td><i class="fas fa-user-cog fa-2x"></i></td>
								</tr>
						</c:if>
						<!-- 비탈퇴이면서 일반 -->
						<c:if test="${mDTO.mRight ne 1 and mDTO.mIsWithDrawal ne 1}">
								<tr>
									<td>${mDTO.mNo }</td>
									<td><a href="adminViewPage?mNo=${mDTO.mNo }">${mDTO.mId }</a></td>
									<td>${mDTO.mName }</td>
									<td>${mDTO.mPhone }</td>
									<td>${mDTO.mZipcode }</td>
									<td>${mDTO.mAddr1 }</td>
									<td>${mDTO.mAddr2}</td>
									<td>${mDTO.mEmail}</td>
									<td><i class="far fa-user fa-2x"></i></td>
								</tr>
						</c:if>
					</c:forEach>
				</c:when>
				
				
			</c:choose>
		</tbody>
	</table>
	<br><br>
	<div class="text-center">
		<c:if test="${page ne null}">
			<span>${pageView }</span>
			<span>${pageVie2 }</span>
			<br><br>
			<form class="text-center">
				<%-- 검색 --%>
				<select name="column">
					<option value="EMPTY">::검색 선택::</option>
					<option value="MNAME">이름</option>
					<option value="MID">아이디</option>
					<option value="MADDR1">주소</option>
				</select>
				<input class="queryInput" type="text" name="query" placeholder="검색어를 입력해주세요" size="25"/>
				<input class="queryBtn" type="button" value="검색" onclick="fn_queryAdminList(this.form)" />
			</form>
		</c:if>
	</div>
</div>

<!-- 관리자가 로그인하면 "관리자메뉴"를 표시한다. -->

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>