<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="게시판" name="title" />
</jsp:include>

<script type="text/javascript">

	function fn_delete(f) {
		if (confirm("삭제하시겠습니까?")) {
			f.action = 'ReviewBoardDelete';
			f.submit(f);
		}
	}
	function fn_updatePage(f) {
		f.action = 'ReviewBoardUpdatePage';
		f.submit(f);
	}
	function fn_replyInsert(f) {
		if(f.reContent.value == ''){
			alert('댓글을 입력해주세요');
		}else{
			f.action = 'ReviewBoardReplyInsert';
			f.submit();
		}
	}
	function fn_replyDelete(f) {
		if (confirm("삭제하시겠습니까?")) {
			f.action = "ReviewBoardReplyDelete";
			f.submit();
		}
	}
	function fn_replyUpdate(f){
		var reNo = f.reNo.value;
		var reContent = document.querySelector('#reContent'+reNo);
		var reContentUpdateBox = document.querySelector('#reContentUpdateBox'+reNo);
		var updateBtn = document.querySelector('#updateBtn'+reNo);
		var deleteBtn = document.querySelector('#deleteBtn'+reNo);
		var saveBtn = document.querySelector('#saveBtn'+reNo);
		var cancelBtn = document.querySelector('#cancelBtn'+reNo);
		
		if(updateBtn.value == '수정'){
			update();
		}
		
		function update(){
			reContent.style.display = 'none';
			reContentUpdateBox.style.display = 'inline';
			updateBtn.style.display = 'none';
			deleteBtn.style.display = 'none';
			saveBtn.style.display = 'inline';
			cancelBtn.style.display = 'inline';
		}
		
	}
	
	function fn_replyCancel(f){
		
		var reNo = f.reNo.value;
		var reContent = document.querySelector('#reContent'+reNo);
		var reContentUpdateBox = document.querySelector('#reContentUpdateBox'+reNo);
		var updateBtn = document.querySelector('#updateBtn'+reNo);
		var deleteBtn = document.querySelector('#deleteBtn'+reNo);
		var saveBtn = document.querySelector('#saveBtn'+reNo);
		var cancelBtn = document.querySelector('#cancelBtn'+reNo);
		
		if(cancelBtn.value == '취소'){
			cancel();
		}
		
		function cancel(){
			reContent.style.display = 'inline';
			reContentUpdateBox.style.display = 'none';
			updateBtn.style.display = 'inline';
			deleteBtn.style.display = 'inline';
			saveBtn.style.display = 'none';
			cancelBtn.style.display = 'none';
		}
		
	}
	
	function fn_replySave(f){
		var reContent = f.reContent.value;
		if(reContent == ''){
			alert('내용을 입력해주세요');
		}else{
			f.action = 'ReviewBoardReplyUpdate';
			f.submit();
		}
	}
	
	$(function() {
	      $('#reContentInsertBox').keyup(function (e){
	          var content = $(this).val();
	          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
	          $('#counter1').html(content.length + '/300');
	      });
	      $('#reContentInsertBox').keyup();
	});
	
</script>
<style>
	.reviewView-box{
		width: 1100px; 
		margin-bottom: 50px; 
		margin: 200px auto;
		text-align: center;
	}
	.reviewView-box #reviewView-table{
		width: 1100px;
		margin: 5px auto;
		border-collapse: collapse;
	}
	.reviewView-box #reviewView-table td{
		border: 1px solid lightgray;
		padding: 10px 20px;
	}
	.reviewView-box tr td:nth-of-type(1) {width: 200px;}
	.reviewView-box #reviewView-table tr td:nth-of-type(1) {width: 200px; font-weight: bold;background: #EAF2FF;}
	.reviewView-box #reviewView-table tr td:nth-of-type(3) {width: 200px; font-weight: bold;background: #EAF2FF;}
	.reviewView-box #reviewView-table tr td:nth-of-type(2), .reviewView-box #reviewView-table tr td:nth-of-type(4) {text-align: left;}
	.reviewView-box #review-img {
		width: 300px;
		height: 250px;
	} 
	.reviewView-box .reviewBtn {width: 80px;  float: right;background: white; cursor: pointer; padding: 10px;border: 1px solid lightgray;}
	.ReviewBoardReplyInsert-box{
      margin: 0 auto;
      width: 1100px;
      text-align: center;
   }

   .ReviewBoardReplyInsert-box th{
      width: 110px;
      background: #EAF2FF;
   }
   .reviewreply-insertTable{
      margin: 10px auto;
      width: 1100px;
   }
   .reviewreply-insertTable th, td{
      border: 1px solid lightgray;
   }
   .reviewreply-insertTable td:nth-of-type(2){
      border: none;
   }
   .reviewreply-insertTable input {
      padding: 5px;
      border: 1px solid lightgray;
      background: white;
      cursor: pointer;
   }
   .reviewreply-insertTable tr:nth-of-type(2) td{
      height: 10px;
      border: none;
   }
   .reviewreply-insertTable tr:nth-of-type(2) td input{
      height: 100%;
   }
	 .limited_text_wrap1{
      width: 990px;
      height: auto;
      position: relative;
      display: inline-block;
   }
   .limited_text_wrap1 textarea{
      width: 100%;
      resize: none;
      min-height: 9.5em;
      line-height: 1.6em;
      max-height: 9em;
   }
   .limited_text_wrap1 span{
      position: absolute;
      bottom: 10px;
      right: 10px;
   }
   #counter1{
      border-radius: 5px;
      padding: 0 5px 0 5px;
      font-size: 1.35em;
   }
	
	.reply-viewTable{
      margin: 0 auto;
      width: 1100px;
   }
   .reply-viewTable th, td{
      border: 1px solid lightgray;
   }
   .reply-viewTable input:nth-of-type(1){
      padding: 10px;
      border: 1px solid lightgray;
      background: white;
   }
   .reply-viewTable input:nth-of-type(2){
      padding: 10px;
      border: 1px solid lightgray;
      background: white;
   }
   .reply-viewTable tr td:nth-of-type(1){
      width: 100px;
      text-align: center;
      font-weight: bold;
      background: #EAF2FF;
   }
   .reply-viewTable tr td:nth-of-type(2){
      width: 860px;
   }
   .reply-viewTable tr td:nth-of-type(3){
      width: 70px;
   }
   .reply-viewTable tr td:nth-of-type(4){
      background: aqua;
      width: 70px;
      white-space: pre-line;
   }
	.hidden-row td{
		border: none;
	}
	#review_name{width: 200px;}
</style>

<div class="reviewView-box">
<form method="post">
	<h2 style="color: #CAC2D1;">${hDTO.mId}님의리뷰입니다.</h2><br/>
	<input type="hidden" name="rNo" value="${hDTO.rNo }"/><br/>
	<table id="reviewView-table">
		<tr>
			<td>TITLE</td>
			<td>${hDTO.rTitle }</td>
			<td>NOTICEDATE</td>
			<td>${hDTO.rRegDate }</td>
		</tr>
		<tr>
			<td>ROOM</td>
			<td>${hDTO.gName }</td>
			<td>RATING</td>
			<td>${hDTO.rRating }점</td>
		</tr>
		<tr>
			<td>CONTENT</td>
			<td colspan="3">
				${hDTO.rContent }<br/>
				<img id="review-img" alt="${hDTO.rFilename }" src="${pageContext.request.contextPath }/resources/storage/${hDTO.rFilename }">
			</td>
		</tr>
		
	</table>
	<%-- <img alt="${hDTO.rFilename }" src="resources/assets/guestroom_img/${hDTO.gName }_1.png"><br/> --%>

	<input class="reviewBtn" type="button" value="LIST" onclick="history.back()"/>
	<c:if test="${loginDTO.mId eq hDTO.mId or loginDTO.mRight eq 1 }">
		<input class="reviewBtn" type="button" value="DELETE" onclick="fn_delete(this.form)"/>
		<input class="reviewBtn" type="button" value="UPDATE" onclick="fn_updatePage(this.form)"/>
	</c:if>
	
</form>
<br/><br/>
<img id="review_name" alt="qna_name" src="resources/assets/name_img/answer_name.png"/><br/> 
<c:if test="${loginDTO.mId ne null }">
	<div class="ReviewBoardReplyInsert-box">
		<form method="POST">
			<table class="reviewreply-insertTable">
				<tr>
					<th>${loginDTO.mId }</th>
					<td>
						<div class="limited_text_wrap1">
							<textarea id="reContentInsertBox" name="reContent" placeholder="답변을 100자 이내로 기재해 주세요."></textarea>
							<span id="counter1">###</span>
						</div>
					</td>
					<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="fn_replyInsert(this.form)"/>
						<input type="hidden" name="mId" value="${loginDTO.mId }"/>
						<input type="hidden" name="rNo" value="${hDTO.rNo }"/>
						<input type="hidden" name="page" value="${page }"/>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</c:if>
<br/>
<div class="ReviewBoardReplyList-box">
	<table class="reply-viewTable">
		<tbody>
			<c:if test="${empty reList }">
				<tr>
					<th colspan="4">아직 답변이 등록되지 않았습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty reList }">
				<c:forEach var="reDTO" items="${reList }">
					<form method="POST">
						<tr>
							<td><span id="mId">${reDTO.mId }</span></td>
							<td>
								<span id="reContent${reDTO.reNo }">${reDTO.reContent }</span>
								<div class="limited_text_wrap2">
									<textarea id="reContentUpdateBox${reDTO.reNo }" name="reContent" style="display:none" rows="2" cols="100">${reDTO.reContent }</textarea>
									<span id="counter2${reDTO.reNo }" style="display: none;">###</span>
                       			</div>
							</td>
							<c:if test="${loginDTO ne null }">
								<c:if test="${loginDTO.mRight eq 1 }">
									<th>
										<input id="updateBtn${reDTO.reNo }" type="button" value="수정" onclick="fn_replyUpdate(this.form)"/>
										<input id="saveBtn${reDTO.reNo }" style="display:none" type="button" value="저장" onclick="fn_replySave(this.form)"/>
									</th>
									<th>
										<input id="deleteBtn${reDTO.reNo }" type="button" value="삭제" onclick="fn_replyDelete(this.form)"/>
										<input id="cancelBtn${reDTO.reNo }" style="display:none" type="button" value="취소" onclick="fn_replyCancel(this.form)"/>
									</th>
								</c:if>
							</c:if>
						</tr>
						<tr class="hidden-row">
							<td>
								<input type="hidden" name="reNo" value="${reDTO.reNo }"/>
								<input type="hidden" name="rNo" value="${reDTO.rNo }"/>
								<input type="hidden" name="page" value="${page }"/>
							</td>
						</tr>
					</form>
				</c:forEach>
			</c:if>
		</tbody>
	</table>


</div></div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>