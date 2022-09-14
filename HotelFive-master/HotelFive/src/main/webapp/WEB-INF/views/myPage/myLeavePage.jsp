<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원탈퇴" name="title"/>
</jsp:include>

<style>
	.leave-box {
		background-image: url("resources/assets/myMain_img/myMainBackground.jpg");
		height: 1200px;
		padding-top: 180px;
	}
	.centered{
		background-color: rgba( 255, 255, 255, 0.5 );  
		box-sizing: border-box;
		margin: 0 450px 0 450px;
        border: 1px inset #dddddd;
        padding: 20px;
        text-align: center;
	}
	.gradient-btn {
		 display: inline-block;
		 padding: 1em 2em;
		 border-radius: 0;
		 color: #b2876f;
		 margin-top:2rem;
		 font-weight: bold;
		 font-size: 0.687rem;
		 letter-spacing: 2px;
		 text-transform: uppercase;
		 text-decoration: none;
		 background: linear-gradient(to right, rgba(#b2876f, 0) 25%, rgba(#b2876f, .8) 75%);
		 background-position: 1% 50%;
		 background-size: 400% 300%;
		 border: 1px solid #b2876f;
	}
	span {display: inline-block; color: #ffebcd; font-size: 20px; }
	h3 {
		color: #ffebcd
	}



	
</style>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

	//비밀번호 검사
	// 세션에 등록된 회원비번이랑 탈퇴 페이지에 입력된 비번을 비교한다.
	$(document).ready(function(){  
		//비밀번호 입력유무 검사
		$('#leaveBtn').click(function(){
			if ($('#mPw').val() == '') {
				//swal("비밀번호를 입력하세요","", 'error');
				alert('비밀번호를 입력하세요');
				$('#mPw').focus();
				return false;
			}
			var mPw = '${loginDTO.mPw}';
			if ( $('#mPw').val() != mPw ) {
				//swal("비밀번호가 일치하지 않습니다.","", 'error');
				alert('비밀번호가 일치하지 않습니다');
				return false;
			}
			if( confirm('정말 탈퇴하시겠습니까?') ){
				f.action = 'myLeave';
				f.submit();
			}
			/* swal({
				  title: "정말 탈퇴하시겠습니까?",
				  text: "",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("탈퇴가 완료되었습니다", {
				      icon: "success",
				    });
				    setTimeout(function(){
				    	f.action = 'myLeave';
						f.submit();
				    }, 1500);
				  } else {
				    swal("취소하였습니다");
				  }
			}); */
			
			
			
		/* 	$.ajax({
				url: 'myLeave',
				type: 'POST',
				dataType: 'JSON',
				data: 'mId=' + $('#mId').val(),
				success: function( responseObject ) { // 세션에 등록되어있기때문에 세션처리로도가능하다
					if ( responseObject.result == 'SUCCESS' ) { // 응답 (YES OR NO 가 응답(전달)된다.)
						alert('정상적으로 탈퇴가 완료되었습니다.');
						location.href = 'main';
					} else {
						alert('탈퇴되지 않았습니다.');
						history.back();
					}
				},
				error: function() {
					alert('AJAX 통신이 실패했습니다.');
				}
			}); */
			
		});
	});
	
	
</script>

<div class="leave-box">
	<form id="f" action="POST">
	
		<h3 class="centered">HotelFive 회원탈퇴안내</h3>
		<div class="centered">
			
			<span>그동안 저희 HotelFive를 이용해 주셔서 진심으로 감사드립니다.</span><br/>
			<span>비밀번호를 입력한 후 회원탈퇴하기 버튼을 클릭해주세요.</span> <span style="color: red; font-weight: bold;">회원탈퇴 후에는 취소가 불가</span>합니다.<br/><br/>
       </div>
      
       <div class="centered">
       		<div >
	       		
	       		<span>비밀번호</span>&nbsp;&nbsp;
	       		<input id="mPw" type="password" name="mPw"><br><br>
     		 
     			<input type="hidden" name="mId" value="${loginDTO.mId }">     			
       			<input class="gradient-btn" type="button" value="취소" onclick="location.href='goMyPage'">
       			<input id="leaveBtn" class="gradient-btn" type="button" value="회원탈퇴하기">
     		</div>	
       </div>
       
	</form>
</div>



	
	
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>