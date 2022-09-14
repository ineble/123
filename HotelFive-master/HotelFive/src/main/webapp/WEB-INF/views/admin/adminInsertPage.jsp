<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp" />


<style type="text/css">
	/* .sign-up-box table {
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
	} */
	
	.sign-up-box {
      border: 2px solid lightgray;
      margin: 30px auto;
      width: 500px;
      padding: 20px 0 30px 70px;
   }
   input[type="text"], input[type="password"] {border: none; padding:10px; border-bottom: 2px solid lightgray;width: 350px;}
   input[type="text"], input[type="password"] {outline: none; border-bottom: 2px solid gray;}
   input[type="button"] {border: none; width: 100px; padding: 10px 0; margin-top:10px;background: #E3EAF3; border-radius: 20px;}
   input[type="reset"] {border: none; width: 100px; padding: 10px 0; margin-top:10px;background: #E3EAF3; border-radius: 20px;}
</style>

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
	
	var authKey =  "";
	
	$(document).ready(function(){
		
		// 1. 아이디 중복 체크
		//    5 ~ 20 사이의 소문자나 숫자를 사용한다. 첫 글자는 소문자이다.
		var regExpID = /^[a-z][a-z0-9]{4,19}$/;  // 첫 글자는 소문자이다.(^[a-z])
		$('#mId').keyup(function(){
			$.ajax({
				url: 'idCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mId=' + $('#mId').val(),
				success: function( responseObject ) {
					// 정규식 test()
					if ( regExpID.test($('#mId').val()) ) {  // 정규식을 만족하면,
						// 가입된 아이디인지 여부 확인
						if ( responseObject.result == 'NO' ) {
							$('#idCheckResult').text('이미 가입된 아이디입니다.');
							$('#idCheckResult').css('color', 'red');
						} else {
							$('#idCheckResult').text('사용할 수 있는 아이디입니다.');
							$('#idCheckResult').css('color', 'blue').css('font-weight', 'bold');
						}
					} else {  // 정규식을 만족하지 않으면
						$('#idCheckResult').text('5~20자, 소문자시작, 소문자+숫자 가능');
						$('#idCheckResult').css('color', 'red');
					}
					
					// 비밀번호 입력란이 비어있으면 -- 한번 입력 후 비워놓으면 'pwCheckResult' 가 안없어지기 때문이다.
					if( $('#mId').val() == '' || $('#mId').val() == null){
						$('#idCheckResult').text('');	
					}
				},
				error: function() {
					swal("AJAX 통신이 실패했습니다.","", 'error');
				}
			});
		});
		
		// 2. 비밀번호 체크
		//    8 ~ 20 사이의 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*)를 사용한다.
		//    각각 1개 이상 포함해야 한다.
		var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
		
		$('#mPw').keyup(function() {
			if ( regExpPW.test($('#mPw').val()) ) {
				$('#pwCheckResult').text('비밀번호 사용 가능합니다.');
				$('#pwCheckResult').css('color', 'blue').css('font-weight', 'bold');
			} else {
				$('#pwCheckResult').text('4~20자, 대문자, 소문자, 숫자, 특수문자(~!@#$%^&*) 포함');
				$('#pwCheckResult').css('color', 'red');
			}
			// 비밀번호 입력란이 비어있으면 -- 한번 입력 후 비워놓으면 'pwCheckResult' 가 안없어지기 때문이다.
			if( $('#mPw').val() == '' || $('#mPw').val() == null){
				$('#pwCheckResult').text('');	
			}
		});
		
		$('#mPw2').keyup(function() {
			// mPw 가 입력이 없으면 mPw2는 확인을 하지 않는다.
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
			
			// 비밀번호 확인 입력란이 비어있으면 -- 한번 입력 후 비워놓으면' pwConfirmResult' 가 안없어지기 때문이다.
			if( $('#mPw2').val() == '' || $('#mPw2').val() == null){
				$('#pwConfirmResult').text('');	
			}
		});
		
		
		// 3. 이메일
		
		var regExpEMAIL = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
		
		$('#mEmail').keyup(function() {
			$.ajax({
				url: 'emailCheck',
				type: 'POST',
				dataType: 'JSON',
				data: 'mEmail=' + $('#mEmail').val(),
				success: function( responseObject ) {
					// 정규식 test()
					if ( regExpEMAIL.test($('#mEmail').val()) ) {
						// 가입된 이메일 여부 확인
						if ( responseObject.result == 'NO' ) {
							$('#emailCheckResult').text('이미 가입된 이메일입니다.');
							$('#emailCheckResult').css('color', 'red');
						} else {
							$('#emailCheckResult').text('사용할 수 있는 이메일입니다.');
							$('#emailCheckResult').css('color', 'blue').css('font-weight', 'bold');
						}
					} else {  // 정규식을 만족하지 않으면
						$('#emailCheckResult').text('올바른 이메일 형식이 아닙니다.');
						$('#emailCheckResult').css('color', 'red');
					}
					// 이메일을 한번 이상 입력 후 비워 놓으면 텍스트 표시없음.
					if( $('#mEmail').val() == '' || $('#mEmail').val() == null){
						$('#emailCheckResult').text('');
					}
				},
				error: function() {
					swal("AJAX 통신이 실패했습니다.","", 'error');
				}
			});
			
		});
		
		// 4. 전화번호(핸드폰)
		var regExpPHONE	= /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;
		$('#mPhone').keyup(function() { // 눌렀을때
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
		
		// 5. 회원가입
		$('#signUpBtn').click(function(){
			
			if( $('#mId').val() == '' || $('#mId').val() == null ){
				swal("아이디를 입력하세요","", 'error');
				$('#mId').focus();
				return false;
			}
			if( $('#mPw').val() == '' || $('#mPw').val() == null ){
				swal("새 비밀번호를 입력하세요","", 'error');
				$('#mPw').focus();
				return false;
			}
			if( $('#mPw').val() != '' && $('#mPw2').val() == '' ){
				swal("비밀번호 재확인을 입력하세요","", 'error');
				$('#mPw').focus();
				return false;
			}
			if( $('#mEmail').val() == '' || $('#mEmail').val() == null){
				swal("이메일을 입력하세요","", 'error');
				$('#mEmail').focus();
				return false;
			}
			
			if( $('#mName').val() == '' || $('#mName').val() == null){
				swal("이름을 입력하세요","", 'error');
				$('#mName').focus();
				return false;
			}
			
			
			if ($('#authKey').val() == authKey && authKey != "") {
				
				swal("일반회원이 추가되었습니다", "", {
				      icon: "success",
				    });
				    setTimeout(function(){
						f.action='adminInsert'
						f.submit();
				    }, 1000);
			} else {
				swal("이메일 인증 번호를 확인하세요.", "", "error");
			}
		
		});
		
		// 6. 입력 초기화
		$('#clearBtn').click(function(){
			$('input[type=text], input[type=password]').each(function(){
				//  각 요소는 each 문 내부에서 $(this) 로 호출한다.
				$(this).val('');
			});
			$('span').each(function(){
				$(this).text('');
			});
			$('#mId').focus();
		});
		
		
		// 7. 이메일 인증
		$('#authMailBtn').click(function(){
						
			$.ajax({
					url : 'emailAuth',
					type : 'POST',
					dataType : 'json',
					data : 'mEmail=' + $('#mEmail').val(),
					success : function(data) {
			
							if( $('#mEmail').val() == '' || $('#mEmail').val() == null){
								swal("이메일을 입력하세요", "", "error");
								return false;
							} else {
								swal("인증번호를 발송했습니다.", "", "success");
								authKey = data.authKey;
							}
					},
					error : function() {
								swal("AJAX 통신이 실패했습니다.","", 'error');
							}
					});
				
		});
		
		// 8. captchar 새로고침
		$('#reGetImageBtn').click(function(){
						
			$.ajax({
					url : 'reGetImage',
					type : 'POST',
					dataType : 'json',
					success : function(data) {
								alert('새로고침'+data.filename);
							},
					error : function() {
								swal("AJAX 통신이 실패했습니다.","", 'error');
							}
					});
				
		});
		
	});
	
</script>
<br><br><br><br><br><br><br><br>

<div class="sign-up-box">
	
    <form id="f" method="POST" >
    	<h2 style="color: #CAC2D1;">회원 가입</h2>
    	아이디<br/>
		<input id="mId" type="text" name="mId" autocomplete="off" /><br/>
		<span id="idCheckResult"></span><br>
		
		비밀번호<br/>
					
		<input id="mPw" type="password" name="mPw" /><br/>
		<span id="pwCheckResult"></span><br/>
		
		비밀번호확인<br/>
		<input id="mPw2" type="password" name="mPw2" /><br/>
		<span id="pwConfirmResult"></span><br/>
		
		이름<br/>
		<input id="mName" type="text" name="mName" /><br/>
		
		이메일<br/>
		<input id="mEmail" type="text" name="mEmail" style="width:250px;"/> 
		<input id="authMailBtn" type="button" value="인증번호 받기"/><br/>
		<span id="emailCheckResult"></span><br/>
		<input id="authKey" type="text" name = "authKey" placeholder="인증번호입력"/><br/>
		
		전화번호<br/>
		<input id="mPhone" type="text" name="mPhone" placeholder="하이픈입력" /><br/>
		<span id="phoneCheckResult"></span><br/>
		
		주소<br/>
		<input type="text" id="mZipcode" name="mZipcode" placeholder="우편번호" style="width:250px;"/>
		<input type="button" onclick="findZipCodeBtn()" value="우편번호 찾기"/><br>
		<input type="text" id="mAddr1"  name ="mAddr1" placeholder="주소"style="width:250px;"/><br>
		<input type="text" id="mAddr2"   name ="mAddr2" placeholder="상세주소"style="width:250px;"/>
		<input type="hidden" id="mAddr3" placeholder="참고항목"><br/>
		<input type="button" value="회원가입" id="signUpBtn"  />
		<input id="clearBtn" type="reset" value="입력취소" />
		
		
	</form>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp" %>