<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>
	 



<style type="text/css">
   .find-pw-box {width: 1000px; margin: 250px auto 150px; }
   .find-pw-box #bold {font-weight: bold; font-size: 14px;}
   .find-pw-box #nobold{font-size: 12px; margin: 0;}
   .find-pw-box #tableon {font-size: 12px; font-weight: bold; color: gray; padding-left: 10px;}
   .find-pw-box table {width: 1000px; border-collapse: collapse; border-bottom: 1px solid black; border-top: 1px solid black; }
   .find-pw-box table tr td {padding: 15px 15px;}
   .find-pw-box table tr td:nth-of-type(1) {text-align: center; font-weight: bold; background: #F9F9F9; width: 200px; font-size: 14px;} 
   .find-pw-box table tr:nth-of-type(2) td, .find-pw-box table tr:nth-of-type(1) td {border-bottom: 1px solid lightgray;}
   .find-pw-box table input[type=text] {width: 300px; padding: 3px 10px; border: 1px solid lightgray; }
   .find-pw-box table input[type=text]:hover, .find-pw-box table input[type=text]:focus {outline: none;}
   .find-pw-box table input[type=button] {padding: 3px; width: 120px; background-color: darkgray; color: white; font-weight: bold; border: none;}
   .find-pw-box table input[type=button]:hover,  .find-pw-box table input[type=button]:focus {outline: none;}
   
</style>

<script type="text/javascript">
   var authKey = "";
   
   $(document).ready(function(){  // onload 이벤트
      $('#findPwBtn').click(function(){  // click 이벤트
         if ($('#mId').val() == '') {
            alert('아이디를 입력하세요.');
            $('#mId').focus();
            return false;
         }
         if ($('#mEmail').val() == '') {
            alert('이메일을 입력하세요.');
            $('#mEmail').focus();
            return false;
         }
         $.ajax({
            url: 'findPw',
            type: 'POST',
            dataType: 'json',
            data: 'mId=' + $('#mId').val() + '&mEmail=' + $('#mEmail').val(),
            success: function( data ) {
               if ( data.result != 'NO' ) {
                  $.ajax({
                     url : 'emailAuth',
                     type : 'POST',
                     dataType : 'json',
                     data : 'mEmail=' + $('#mEmail').val(),
                     success : function(data) {
                           alert('인증번호를 발송했습니다.');
                           authKey = data.authKey;
                     },
                     error : function() {
                        alert('AJAX 통신이 실패했습니다.');
                     }
                  });
               } else {
                  alert('제출하신 회원 정보가 없습니다.');
                  
               }
            },
            error: function() {
               alert('AJAX 통신이 실패했습니다.');
            }
         });
         
      });
   
      $('#realFindPwBtn').click(function(){

         if ($('#authKey').val() == authKey && authKey != "") {
            alert('인증되었습니다.');
            location.href = 'changePwPage?mId=' + $('#mId').val();
            }else if(mId == ""){
            alert('이메일인증을 진행하세요.');
         }
         else {
            alert('인증번호를 확인하세요.');
         }
         
      });
   
   
   });
   
</script>
<div class="find-pw-box">
   <p id="bold">비밀번호 찾기</p>
   <hr id="line"/>
   <p id="nobold">회원가입 시, 입력하신 회원정보 또는 본인인증으로 비밀번호를 확인할 수 있습니다.<p>
   <p id="nobold">인증번호는 가입 시 적어주신 이메일로 보내드립니다.<p>
   <form method="POST">
       <br/><p id="tableon">  본인확인용 정보로 찾기</p>  
       <table>
         <tr>
            <td>아이디</td>
            <td><input id="mId" type="text" name="mId" autofocus /></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td>
               <input id="mEmail" type="text" name="mEmail"/>
               <input id="findPwBtn" type="button" value="인증번호 받기" />
            </td>
         </tr>
         <tr>
            <td>인증번호 입력</td>
            <td>
               <input id="authKey" type="text" name="authKey"/>
               <input id="realFindPwBtn" type="button" value="비밀번호 찾기" />               
            </td>
         </tr>
         
      </table>
   </form>
</div>




<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>