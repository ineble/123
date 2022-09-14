<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="QNA게시판" name="title"/>
</jsp:include>
<style type="text/css">
.qnaBoard-Listbox{
		width: 1100px; 
		margin-bottom: 50px; 
		margin: 200px auto; 
	}
	.qnaBoard-Listbox table{margin:auto; border-collapse: collapse;width: 1100px;}
	.qnaBoard-Listbox thead td {background: #DAE2F0;}
	.qnaBoard-Listbox td {text-align: center; padding:10px;border-bottom: 1px solid lightgray;}
	.qnaBoard-Listbox tr td:nth-of-type(1) {width: 100px;}
	.qnaBoard-Listbox tr td:nth-of-type(2) {width: 700px;}
	.qnaBoard-Listbox tr td:nth-of-type(3) {width: 150px;}
	.qnaBoard-Listbox tr td:nth-of-type(4) {width: 150px;}
	.qnaBoard-Listbox tfoot input {
		border: 1px solid lightgray;
		background: white;
		padding: 5px;
		float: right;
		cursor: pointer;
	}
	.qnaBoard-Listbox tfoot tr td{
		border: none;
	}
	.qna_backimg {
		width: 100%;
	}
	.qna_backimg {
		width: 100%; 
		height: 750px; 
		background-size: cover;
		background-image: url("resources/assets/background_img/backimg.jpg"); 
		text-align: center; 
		color: black; 
		padding-top: 300px;	
	}
	#pagetitle {font-size: 85px;}
	#hotelfive, #explain {font-weight: bold;}
	#explain {font-size: 15px;}
	
	.tab_wrap{
		margin: 60px auto;
		width: 1100px;
		border: none;
	}
	button{
		background: none;
		border: 0;
		outline: 0;
		cursor: pointer;
	}
	.tab_menu_container{
		display: flex;
	}
	.tab_menu_btn{
		width: 275px;
		height: 60px;
		ttansition: 0.3s all;
	}
	.tab_menu_btn.on{
		border: 2px solid #7A8290;
		/* border-bottom: 2px solid #9AA2B0; */
		font-weight: bold;
		color: #7A8290;
	}
	.tab_menu_btn:hover {
		
		color: #7A8290;
	}
	.tab_box{
		background: #DAE2F0;
		display: none;
		padding: 20px;
	}
	.tab_box.on{
		display: block;
	}
	.tab_box_answer{
		text-indent: 1em;
	}
	.title_btn{
		paddig: 0;
		border: none;
		background: white;
		cursor: pointer;
	}
	input:focus {
		outline: none;
	}
	a:link{text-decoration: none;}
	a:visited{text-decoration: none;}
</style>

<script type="text/javascript">

	function fn_viewCheck(f){
		
			f.action = "qnaBoardView";
			f.submit();
		}

</script>

<div class="qnaBoard-Listbox">
	<h1 style="color: #CAC2D1;">QNA</h1>
						
	<table>
		<thead>
			<tr>
				<td>글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list }">
				<tr>
					<td colspan="4">작성된 게시글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="qDTO" items="${list }">
					<c:if test="${qDTO.qIsdelete eq 1 }">
						<tr>
							<td>${qDTO.qNo }</td>
							<td>
								<form>
									<a href="qnaBoardView?qNo=${qDTO.qNo }">${qDTO.qTitle }</a>
									<i class="fas fa-lock-open"></i>
								</form>
								<c:if test="${qDTO.count ne 0 }">
									<span style="color:rgb(150,150,250)">[답변등록완료]</span>									
								</c:if>
							</td>
							<c:if test="${qDTO.mId ne null }">
								<td>${qDTO.mId }</td>
							</c:if>
							<c:if test="${qDTO.mId eq null }">
								<td>${qDTO.nmName }</td>
							</c:if>
							<td>${qDTO.qNoticedate }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					${pageView }
					<input type="button" value="글쓰기" onclick="location.href='qnaBoardInsertPage'"/>				
				</td>
			</tr>
		</tfoot>
	</table>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>