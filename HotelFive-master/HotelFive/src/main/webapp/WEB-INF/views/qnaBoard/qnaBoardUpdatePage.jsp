<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="QNA게시판" name="title"/>
</jsp:include>
<style type="text/css">
   .qnaBoard-viewBox{
      width: 1100px; 
      margin-bottom: 30px; 
      margin: 50px auto;
      text-align: center;
   }
   .qnaBoard-viewBox table{
      width: 1100px;
      margin: 20px auto;
      border-collapse: collapse;
   }
   .qnaBoard-viewBox th, td{
      border: 1px solid lightgray;
   }
   .qnaBoard-viewBox th{
      background: #EAF2FF;
      width: 110px;
   }
   .title-table tbody tr:nth-of-type(1) input{
      float: left;
      padding: 3px;
      width: 300px;
   }
   .title-table tbody tr td{
      width: 390px;
   }
   .title-table tbody tr:nth-of-type(2) input{
      float: left;
      padding: 3px;
      width: 850px;
   }
   .content-table input{
   	  width: 80px; 
   	  padding: 10px;
      border: 1px solid lightgray;
      float: right;
      background: white;
      cursor: pointer;
   }
   .content-table tfoot tr th{
      border: none;
   }
   #pass-caption{
      font-size: 0.8em;
      color: crimson;
   }
   .limited_text_wrap{
      width: 985px;
      height: auto;
      position: relative;
      display: inline-block;
   }
   .limited_text_wrap textarea{
      width: 100%;
      resize: none;
      min-height: 19.5em;
      line-height: 1.6em;
      max-height: 13em;
   }
   .limited_text_wrap span{
      position: absolute;
      bottom: 10px;
      right: 10px;
   }
   #counter{
      background: #CCCCCC;
      border-radius: 5px;
      padding: 0 5px 0 5px;
      font-size: 1.35em;
   }
   .none{
      border: none;
      background: white;
   }
   .notice_backimg {
		width: 100%; 
		height: 750px; 
		background-size: cover;
		background-image: url("resources/assets/background_img/backimg.jpg"); 
		text-align: center; 
		color: white; 
		padding-top: 300px;
	}
	
	.notice_backimg #pagetitle {font-size: 85px;}
	.notice_backimg #hotelfive, #explain {font-weight: bold;}
	.notice_backimg #explain {font-size: 15px;}
	#notice_name {width: 200px;}
</style>
<script type="text/javascript">
   function fn_inputCheck(f){
      if(f.qTitle.value == ''){
         alert('제목을 입력하세요');
         f.qTitle.focus();
         return;
      }
      if(f.qContent.value == ''){
         alert('내용을 입력하세요');
         f.qContent.focus();
         return;
      }
      if(f.qPw.value == ''){
         alert('비밀번호를 입력하세요');
         f.qPw.focus();
         return;
      }
      var qPw = '${qDTO.qPw}';
      if(f.qPw.value != qPw){
         alert('비밀번호가 다릅니다.');
      }else{
         f.action = 'qnaBoardUpdate';
         f.submit();
      }
   }
   
   $(function() {
      
      $('#content').on('keyup', function (e){
          var content = $(this).val();
          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
          $('#counter').html(content.length + '/200');
      });
      $('#content').keyup();
      
      $('#content').on('keyup', function(){
      if($(this).val().length > 200){
         $(this).val($(this).val().substring(0, 200));
      }
      });
   });
   
</script>
<div class="notice_backimg">
	<h3 id="hotelfive">Hotel Five</h3>
	<h1 id="pagetitle">Community</h1>
	<p id="explain">호텔파이브의 각종 이벤트 및 소식</p>
</div>
<div class="qnaBoard-viewBox">
	<img id="notice_name" alt="notice_name" src="resources/assets/name_img/update_name.png"/><br/> 
   <form method="POST">
      <div class="viewBox">
         <table class="title-table">
            <tbody>
               <tr>
                  <th>작성자</th>
                  <td>
                     <c:if test="${qDTO.nmName ne null }">
                        ${qDTO.nmName }
                     </c:if>
                     <c:if test="${qDTO.nmName eq null }">
                        ${qDTO.mId }
                     </c:if>
                  </td>
                  <th>비밀번호</th>
                  <td>
                     <input type="text" name="qPw"/>
                     <span id="pass-caption">비밀번호 입력</span>
                  </td>
               </tr>
               <tr>
                  <th>제목</th>
                  <td colspan="3">
                     <input type="text" name="qTitle" value="${qDTO.qTitle }"/>
                  </td>
               </tr>
            </tbody>
         </table>
         <br/>
         <table class="content-table">
            <tbody>
               <tr>
                  <th>CONTENT</th>
                  <td colspan="2">
                     <div class="limited_text_wrap">
                        <textarea id="content" name="qContent" placeholder="질문사항을 200자 이내로 기재해 주세요.">${qDTO.qContent }</textarea>
                        <span id="counter">###</span>
                     </div>
                  </td>
               </tr>
            </tbody>
            <tfoot>
               <tr>
                  <td class="none" colspan="2">
                     <input type="button" value="CANCEL" onclick="history.go(-1)"/>
                     <input type="button" value="SAVE" onclick="fn_inputCheck(this.form)"/>
                     <input type="hidden" name="mId" value="${qDTO.mId }"/>
                     <input type="hidden" name="qNo" value="${qDTO.qNo }"/>
                  </td>
               </tr>
            </tfoot>
         </table>
      </div>
   </form>
</div>
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>