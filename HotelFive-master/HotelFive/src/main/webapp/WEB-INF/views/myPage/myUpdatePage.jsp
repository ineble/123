<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="회원정보수정" name="title"/>
</jsp:include>

<link rel="stylesheet" href="resources/assets/style/myPage/myUpdatePage.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findZipCodeBtn() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var mAddr1 = $('#mAddr1'); // 주소 변수
            var mAddr3 = $('#mAddr3'); // 참고항목 변수

          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            	mAddr1 = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	mAddr1 = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	mAddr3 += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                	mAddr3 += (mAddr3 !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(mAddr3 !== ''){
                	mAddr3 = ' (' + mAddr3 + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("mAddr3").value = mAddr3;
            
            } else {
                document.getElementById("mAddr3").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('mZipcode').value = data.zonecode;
            document.getElementById("mAddr1").value = mAddr1;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("mAddr2").focus();
        }
    }).open();
}
</script>

<script type="text/javascript">

	$(document).ready(function(){
		var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
		$('#mPw').keyup(function() {
			if( regExpPW.test($('#mPw').val()) ){
				$('#pwCheckResult').text('비밀번호 사용 가능합니다.');
				$('#pwCheckResult').css('color', 'blue').css('font-weight', 'bold');
			} else {
				$('#pwCheckResult').text('4~20, 대문자, 소문자, 숫자, 특수문자 (~!@#$%^&*) 포함');
				$('#pwCheckResult').css('color', 'red');
			}
			if( $('#mPw').val() == '' || $('#mPw').val() == null){
				$('#pwCheckResult').text('');	
			}
		});
		$('#mPw2').keyup(function() {
			if( $('#mPw').val() != '' && $('#mPw').val() != null && regExpPW.test($('#mPw').val()) ){
				if( $('#mPw').val() !=  $('#mPw2').val() ){
					$('#pwConfirmResult').text('비밀번호가 일치하지  않습니다.');					
					$('#pwConfirmResult').css('color', 'red');					
				} else {
					$('#pwConfirmResult').text('비밀번호가 일치합니다.');					
					$('#pwConfirmResult').css('color', 'blue').css('font-weight', 'bold');					
				}
			} else {
				$('#pwConfirmResult').text('새 비밀번호의 조건이 정규식과 일치하지 않습니다');
				$('#pwConfirmResult').css('color', 'red');					
			}
			
			if( $('#mPw2').val() == '' || $('#mPw2').val() == null){
				$('#pwConfirmResult').text('');	
			}
		});
		
		var regExpEMAIL = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
		$('#mEmail').keyup(function(){
			$.ajax({
				url: 'emailCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mEmail=' + $('#mEmail').val(),
				success: function( responseObject ) {
					// 정규식 test()
					if ( regExpEMAIL.test($('#mEmail').val()) ) {
						if ( responseObject.result == 'EXIST' ) {
							$('#emailCheckResult').text('이미 가입된 이메일입니다.');
							$('#emailCheckResult').css('color', 'red');
						} else {
							$('#emailCheckResult').text('변경 가능한 이메일입니다.');
							$('#emailCheckResult').css('color', 'blue').css('font-weight', 'bold');
						}
					} else {
						$('#emailCheckResult').text('올바른 이메일 형식이 아닙니다.');
						$('#emailCheckResult').css('color', 'red');
					}
					// 이메일을 한번 이상 입력 후 비워 놓으면 텍스트 표시없음.
					if( $('#mEmail').val() == '' || $('#mEmail').val() == null){
						$('#emailCheckResult').text('');
					}
				},
				error: function() {
					alert('AJAX 통신이 실패했습니다.');
				}
			});
		});
		
		// 4. 전화번호(핸드폰)
		var regExpPHONE	= /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;
		$('#mPhone').keyup(function() {
			if( regExpPHONE.test($('#mPhone').val()) ) {
				$('#phoneCheckResult').text('사용 가능한 번호입니다.');
				$('#phoneCheckResult').css('color', 'blue').css('font-weight', 'bold');
			} else {
				$('#phoneCheckResult').text('올바른 전화번호 형식이 아닙니다.');
				$('#phoneCheckResult').css('color', 'red');
			}
			// 전화번호를 한번 이상 입력 후 비워 놓으면 텍스트 표시없음.
			if( $('#mPhone').val() == '' || $('#mPhone').val() == null){ 
				$('#phoneCheckResult').text('');
			}
		});
});
	
	 function fn_update(f){
		
		if( $('#mPw').val() == '' || $('#mPw').val() == null ){
			alert('새 비밀번호를 입력하세요');
			$('#mPw').focus();
			return false;
		}
		if( $('#mPw').val() != '' && $('#mPw2').val() == '' ){
			alert('비밀번호 재확인을 입력하세요');
			$('#mPw').focus();
			return false;
		}
		
		if( $('#mName').val() == '' || $('#mName').val() == null){
			alert('이름을 입력하세요');
			$('#mName').focus();
			return false;
		}
		
		if( $('#mEmail').val() == '' || $('#mEmail').val() == null){
			alert('이메일을 입력하세요');
			$('#mEmail').focus();
			return false;
		}
	
		if( confirm('개인정보를 수정하시겠습니까?') ) {
			f.action = 'myUpdate';
			f.submit();
		}
		/* swal({
			  title: "개인정보를 수정하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("수정이 완료되었습니다", {
			      icon: "success",
			    });
			    setTimeout(function(){
			    	f.action = 'myUpdate';
					f.submit();
			    }, 1000);
			  } else {
			    swal("취소하였습니다");
			  }
		}); */
	} 
	
	

</script>

	<div class="myUpdate-wrap">
		<h1>회원정보</h1>
	    <form method="POST">
	  	<div class="update-box">	
			<table id="update-table">
				<tbody>
					<tr>
						<td>*아이디</td>
						<td>
							<span id="span-mId" style="">${mDTO.mId }</span> 
							
						</td> 
					</tr>
					<tr>
						<td>*새 비밀번호</td>
						<td>
							<input id="mPw" type="password" name="mPw">
							<span id="pwCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td>
							<input id="mPw2" type="password" name="mPw2">
							<span id="pwConfirmResult"></span>
						</td>
					</tr>
					<tr>
						<td>*이름</td>
						<td><input id="mName" type="text" name="mName" value="${mDTO.mName}" style="width: 100px;" maxlength="5"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input id="mEmail" type="text" name="mEmail" value="${mDTO.mEmail}" style="width:200px;" />
							<span id="emailCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td>*휴대폰번호</td>
						<td>
							<input id="mPhone" type="text" name="mPhone" value="${mDTO.mPhone}" placeholder="하이픈(-)포함" style="width:200px;"/>
							<span id="phoneCheckResult"></span>
						</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" id="mZipcode" name="mZipcode" value="${mDTO.mZipcode}" style="width:250px;" placeholder="우편번호" readonly >
							<input type="button" onclick="findZipCodeBtn()" value="우편번호 찾기"><br>
							<input type="text" id="mAddr1" name="mAddr1" value="${mDTO.mAddr1}" placeholder="주소" readonly style="width:250px;"><br>
							<input type="text" id="mAddr2" name="mAddr2" value="${mDTO.mAddr2}" placeholder="상세주소" style="width:250px;">
							<input type="hidden" id="mAddr3" placeholder="참고항목" readonly><br/>
						</td>
					</tr>
				</tbody>
				</table>
				<input type="hidden" name="mId" value="${mDTO.mId }">
				<input class="button cancelBtn" type="button" value="취소" onclick="location.href='goMyPage'" />
				<input class="button myUpdateBtn" type="button" value="정보수정하기" onclick="fn_update(this.form)" />
			</div>
		</form>
	</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>