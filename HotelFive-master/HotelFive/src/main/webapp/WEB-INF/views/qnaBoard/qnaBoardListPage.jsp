<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="QNA게시판" name="title"/>
</jsp:include>
<script type="text/javascript">

   function fn_viewCheck(f){
      var inputPw = prompt('게시글 비밀번호를 입력하세요');
      var qPw = f.qPw.value;
      if(inputPw != null){
         if(inputPw != qPw){
            alert('비밀번호가 일치하지 않습니다');
            return;
         }else{
            f.action = "qnaBoardView";
            f.submit();
         }
      }
   }

   $(document).ready(function(){
      
      $("p.title").on('click',function(){
           $(this).next(".con").slideToggle(100);
         });
         
      $('.tab_menu_btn').on('click', function(){
         
         $('.tab_menu_btn').removeClass('on');
         $(this).addClass('on');
         
         var idx = $('.tab_menu_btn').index(this);
         
         $('.tab_box').hide();
         $('.tab_box').eq(idx).show();
         
      });
         
   });

</script>
<style type="text/css">
   .qnaBoard-Listbox{
      width: 1100px; 
      margin-bottom: 50px; 
      margin: 50px auto; 
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
      height: 750px; 
      background-size: cover;
      background-image: url("resources/assets/background_img/backimg.jpg"); 
      text-align: center; 
      color: white; 
      padding-top: 300px;   
   }
   #pagetitle {font-size: 85px;}
   #hotelfive, #explain {font-weight: bold;}
   #explain {font-size: 15px;}
   .qnaInsertBtn {float: right; margin-bottom: 10px; text-decoration: none;}
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

<div class="qna_backimg">
   <h3 id="hotelfive">Hotel Five</h3>
   <h1 id="pagetitle">Community</h1>
   <p id="explain">호텔파이브에 대한 관련 질문</p>
</div>

<div class="tab_wrap">
   <h1 style="color: #CAC2D1;">FAQ</h1>
   <div class="tab_menu_container">
      <button class="tab_menu_btn on" type="button">체크인</button>
      <button class="tab_menu_btn" type="button">체크아웃</button>
      <button class="tab_menu_btn" type="button">주변시설</button>
      <button class="tab_menu_btn" type="button">주변관광지</button>
   </div>
   <div class="tab_box_container">
      <div class="tab_box on">
         <p class="tab_box_question"><i class="fas fa-question"></i>&nbsp;체크인 시간은 몇시인가요?</p>
         <p class="tab_box_answer"><i class="fas fa-caret-right"></i>&nbsp;체크인 시간은 3 p.m 입니다.</p>
      </div>
      <div class="tab_box">
         <p class="tab_box_question"><i class="fas fa-question"></i>&nbsp;체크아웃 시간은 몇시인가요?</p>
         <p class="tab_box_answer"><i class="fas fa-caret-right"></i>&nbsp;체크아웃 시간은 11 a.m 입니다.</p>
      </div>
      <div class="tab_box">
         <p class="tab_box_question"><i class="fas fa-question"></i>&nbsp;호텔 시설은 무엇이 있나요?</p>
         <p class="tab_box_answer"><i class="fas fa-caret-right"></i>&nbsp;수영장, 헬스클럽, 레스토랑등 고객님의 즐거움을 위한 다양한 시설이 준비되어 있습니다.</p>
      </div>
      <div class="tab_box">
         <p><i class="fas fa-question"></i>&nbsp;호텔 주변관광지는 어떤 것이 있나요?</p>
         <p class="tab_box_answer"><i class="fas fa-caret-right"></i>&nbsp;호텔은 신촌역과 매우 인접해 있어 서울내의 다양한 관광지로의 접근성이 좋고 도보로 홍대, 합정 등 번화가로 갈 수 있습니다.</p>
      </div>
   </div>
</div>

<div class="qnaBoard-Listbox">
   <!-- 로그인해야 질문 작성 가능 -->
   <h1 style="color: #CAC2D1;">QNA</h1>
   <a class="qnaInsertBtn" href='qnaBoardInsertPage'><i class="fas fa-user-edit fa-2x"></i>게시물 작성</a><br/>               
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
                           <c:if test="${loginDTO.mId == 'admin' }">
                              <a href="qnaBoardView?qNo=${qDTO.qNo }">${qDTO.qTitle }</a>
                              <i class="fas fa-lock-open"></i>
                           </c:if>
                           <c:if test="${loginDTO.mId != 'admin' }">
                              <input class="title_btn" type="button" value="${qDTO.qTitle }" onclick="fn_viewCheck(this.form)"/>
                              <i class="fas fa-lock"></i>
                              <input type="hidden" name="qNo" value="${qDTO.qNo }"/>
                              <input type="hidden" name="qPw" value="${qDTO.qPw }"/>
                           </c:if>
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
            </td>
         </tr>
      </tfoot>
   </table>
</div>

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>