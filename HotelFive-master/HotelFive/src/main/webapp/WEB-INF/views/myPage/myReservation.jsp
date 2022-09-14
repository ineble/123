<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.*"  %>


<style>
   tr, td {text-align: center;}
   .confirmBtn, .cancelBtn{
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 5px 10px;
	  text-align: center;
	  text-decoration: none;
	  font-size: 13px;
	  cursor: pointer;
	}
	
	.container { margin-bottom: 200px;}
	.confirmBtn:hover { background-color: #3e8e41; }
	.cancelBtn:hover{ background-color: #3e8e41; }
</style>

<script>
   
   // var today = 1;

   function fn_reservationCancle(f){
      
      if(confirm('예약을 취소하시겠습니까?')){
         f.action="reservationCancle";
         f.submit();
      }
   }
	// 예약 취소하기
	function fn_ReservationCancel(f){
		swal({
			  title: "정말로 예약을 취소하시겠습니까?",
			  text: "",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("예약이 취소되었습니다", {
			      icon: "success",
			    });
			    setTimeout(function(){
			    	f.action = 'reservationCancle';
					f.submit();
			    }, 1000);
			  } else {
			    swal("취소하였습니다");
			  }
		});
	}
   
</script>
<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="나의예약현황" name="title"/>
</jsp:include>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><!-- alert 꾸미기 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<br><br><br><br><br><br><br><br><br><br>

   <div class="container">
   	 <h3 class="text-center">${loginDTO.mName } 님 예약내역</h3>
   	 <br>
   	 <table class="table table-hover">
   	 	<thead>
   	 		<tr>
   	 			<td>예약번호</td>
   	 			<td>객실이름</td>
   	 			<td>인원</td>
   	 			<td>가격</td>
   	 			<td>체크인</td>
   	 			<td>체크아웃</td>
   	 			<td>예약현황</td>
   	 			<td>취소여부</td>
   	 		</tr>
   	 	</thead>
   	 	<tbody class="search row">
   	 		<c:if test="${empty list }">
	        	 <tr>
	           		<td colspan="9">예약한 방이 없습니다.</td>
	           	</tr> 
         	</c:if>
         	 <c:if test="${not empty list }">
               <c:forEach var="rDTO" items="${list }">
	              <form method="POST">
		              <tr>
			              <c:if test="${rDTO.rApproval eq 0}"> <!-- 최초 : 승인대기, 예약취소 -->
				              	<td>${rDTO.rNo }</td>
				              	<td>${rDTO.gName }</td>
				              	<td>${rDTO.rPeople }</td>
				              	<td>${rDTO.rPrice }</td>
				              	<td>${rDTO.rCheckIn }</td>
				              	<td>${rDTO.rCheckOut }</td>
				              	<td>
									<input type="hidden" name="rNo" value="${rDTO.rNo }">
									<input type="hidden" name="mNo" value="${rDTO.mNo }">
									<input class="cancelBtn" type="button" value="예약대기" disabled>
								</td>
								<td>
									<input class="cancelBtn" type="button" value="예약취소" onclick="fn_ReservationCancel(this.form)">
								</td>
							</c:if>
							<c:if test="${rDTO.rApproval eq 1}"> <!-- 승인완료 -->
				              	<td>${rDTO.rNo }</td>
				              	<td>${rDTO.rPeople }</td>
				              	<td>${rDTO.rPrice }</td>
				              	<td>${rDTO.rCheckIn }</td>
				              	<td>${rDTO.rCheckOut }</td>
				              	<td>${rDTO.gName }</td>
				              	<td><input class="cancelBtn" type="button" value="예약확정" disabled></td>
								<td>
									
								</td>
							</c:if>
			            </tr>
	             </form>
               </c:forEach>
         	</c:if>
   	 	</tbody>
   	 </table>
     
        
            <%-- 객실 : ${rDTO.gName}
	                  ${rDTO.rCheckIn } ~ ${rDTO.rCheckOut }<br/>
	                     <c:if test="${rDTO.rApproval eq 0 }">
	                        예약대기 <input type="button" value="예약취소" onclick="fn_reservationCancle(this.form)">
	                     </c:if>
	                     <c:if test="${rDTO.rApproval eq 1 }">
	                        예약승인
	                     </c:if>
	                  
	                 <input type="hidden" name="rNo" value="${rDTO.rNo }"/> 
	                 <input type="hidden" name="mNo" value="${rDTO.mNo }"/> 
	                     <hr/> --%>
        
     
      
   </div>
<br><br><br><br><br><br><br><br><br>
   
<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>