<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	.button{
	  display: inline-block;
	  border-radius: 4px;
	  background-color: #f4511e;
	  border: none;
	  color: #FFFFFF;
	  text-align: center;
	  font-size: 28px;
	  padding: 20px;
	  width: 200px;
	  transition: all 0.5s;
	  cursor: pointer;
	  margin: 5px;
		vertical-align: middle;
	}
	
	.button span {
	  cursor: pointer;
	  display: inline-block;
	  position: relative;
	  transition: 0.5s;
	}

	.button span:after {
	  content: '\00bb';
	  position: absolute;
	  opacity: 0;
	  top: 0;
	  right: -20px;
	  transition: 0.5s;
	}

	.button:hover span {
	  padding-right: 25px;
	}
	
	.button:hover span:after {
	  opacity: 1;
	  right: 0;
	}
</style>
<script>
    //아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
    
    $("#mPw").keyup(function(){
        var mPw=$(this).val();
        // 비밀번호 검증할 정규 표현식
        var regExpPW = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*])[A-Za-z0-9~!@#$%^&*]{4,20}$/;
        if(regExpPW.test(mPw)){//정규표현식을 통과 한다면
                    $("#pwCheckResult").hide();
                    successState("#mPw");
        }else{//정규표현식을 통과하지 못하면
                    $("#pwCheckResult").show();
                    errorState("#mPw");
        }
        if( $('#mPw').val() == '' || $('#mPw').val() == null){
			$('#pwCheckResult').text('');	
		}
        
    });
    $("#mPw2").keyup(function(){
        var mPw2=$(this).val();
        var mPw=$("#mPw").val();
        
     	// mPw 가 입력이 없으면 mPw2는 확인을 하지 않는다.
        if( $('#mPw').val() == '' || $('#mPw').val() == null ){
			$('#pwConfirmResult').text('');
        }
        // 비밀번호 같은지 확인
        if(mPw2==mPw){//비밀번호 같다면
            $("#pwConfirmResult").hide();
            successState("#mPw2");
        }else{//비밀번호 다르다면
            $("#pwConfirmResult").show();
            errorState("#mPw2");
        }
        
     // 비밀번호 확인 입력란이 비어있으면 -- 한번 입력 후 비워놓으면' pwConfirmResult' 가 안없어지기 때문이다.
		if( $('#mPw2').val() == '' || $('#mPw2').val() == null){
			$('#pwConfirmResult').text('');	
		}
        
    });
    var regExpEMAIL = /^[a-z][a-z0-9\-\_]+@[A-Za-z0-9]{3,}(\.[A-Za-z]{2,6}){1,2}$/;
    $("#mEmail").keyup(function(){
        var mEmail=$(this).val();
        // 이메일 검증할 정규 표현식
        if(regExpEMAIL.test(mEmail)){//정규표현식을 통과 한다면
                    $("#emailCheckResult").hide();
                    successState("#mEmail");
        }else{//정규표현식을 통과하지 못하면
                    $("#emailCheckResult").show();
                    errorState("#mEmail");
        }
    });
    
    var regExpPHONE	= /^01[0|1|6|9]-[0-9]{3,4}-[0-9]{4}$/;
   	var mEmail=$(this).val();
	$('#mPhone').keyup(function() { // 눌렀을때
		 if(regExpEMAIL.test(mEmail)){//정규표현식을 통과 한다면
             $("#emailCheckResult").hide();
             successState("#mEmail");
 		}else{//정규표현식을 통과하지 못하면
             $("#emailCheckResult").show();
             errorState("#mEmail");
 		}
		// 전화번호를 한번 이상 입력 후 비워 놓으면 텍스트 표시없음.
		if( $('#mPhone').val() == '' || $('#mPhone').val() == null){ 
			$('#phoneCheckResult').text('');
		}
	});
   
</script>    
</head>
<body>
	
	<div class="container">
    <h3>회원가입 폼 입니다.</h3>
    <form method="post" id="myForm">
    
        <div class="form-group has-feedback ">
            <label class="control-label" for="mId">아이디</label>
            <input class="form-control" type="hidden" name="mId" id="mId" value="${mDTO.mId }"/>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
        <div class="form-group has-feedback">
            <label class="control-label" for="mPw">*비밀번호</label>
            <input class="form-control" type="password" name="mPw" id="mPw"/>
            <span id="pwCheckResult" class="help-block">'4~20, 대문자, 소문자, 숫자, 특수문자 (~!@#$%^&*) 포함'</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
        <div class="form-group has-feedback">
            <label class="control-label" for="mPw2">비밀번호 재확인</label>
            <input class="form-control" type="password" name="mPw2" id="mPw2"/>
            <span id="pwConfirmResult" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
        <div class="form-group has-feedback">
            <label class="control-label" for="mName">이름</label>
            <input class="form-control" type="text" name="mName" id="mName" value="${mDTO.mName }"/>
        </div>
        
        <div class="form-group has-feedback">
            <label class="control-label" for="mEmail">이메일</label>
            <input class="form-control" type="text" name="mEmail" id="mEmail"/>
            <span id="emailCheckResult" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
        <div class="form-group has-feedback">
            <label class="control-label" for="mPhone">*휴대폰번호</label>
            <input class="form-control" type="text" name="mPhone" id="mPhone" value="${mDTO.mPhone}" placeholder="하이픈(-)포함"/>
            <span id="emailCheckResult" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        
         <div class="form-group has-feedback">
            <label class="control-label" for="mAddr1">주소</label>
            <input class="form-control" type="text" id="mZipcode" name="mZipcode" value="${mDTO.mZipcode}" size="5" placeholder="우편번호" readonly>
			<input class="btn btn-success" type="button" onclick="findZipCodeBtn()" value="우편번호 찾기"><br>
			<input class="form-control" type="text" id="mAddr1" name="mAddr1" value="${mDTO.mAddr1}" placeholder="주소" readonly><br>
			<input class="form-control" type="text" id="mAddr2" name="mAddr2" value="${mDTO.mAddr2}" placeholder="상세주소">
			<input type="hidden" id="mAddr3" placeholder="참고항목" readonly>
        </div>
        
        <button class="btn btn-success" type="submit">가입</button>
    </form>
</div>
	
</body>
</html>