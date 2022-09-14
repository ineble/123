<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!-- 동적인 페이지 포함 -->
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="객실검색" name="title"/>
</jsp:include>

<style type="text/css">
	.cal_top{
	    text-align: center;
	    font-size: 30px;
	    padding-top: 50px;
	    padding-bottom: 40px;
	}
	.cal_top #rCheckIn, .cal_top #rCheckOut {border: none; border-bottom: 1px solid black;}
	.cal_top #rCheckIn:focus, .cal_top #rCheckOut:focus {outline: none;}
	.cal_top input[type=button] {width: 80px; border: none; background-color: darkgray; color: white; }
	.cal_top input[type=button]:hover, .cal_top input[type=button]:focus {background-color: #353535; outline: none;} 
	#info {
		margin : auto;
		text-align: center;
		padding-bottom: 30px;
		width: 1200px;
	}
	#cal{
	    text-align: center;  
	    display: inline-block;  
	    padding-right: 30px;
	}
	#cal_tab_info {
		display: inline-block;
		padding-left: 30px;
	}
	#cal_move {
		text-align: center;
		padding-bottom: 10px;
	}
	#cal_tab_info h1 {display:inline;  float: right;}
	#cal_tab_info table {height: 100px;}
	#cal_tab_info table td:first-of-type{font-weight: bold; vertical-align: top;}
	#cal_tab_info table td{padding:5px;}
	#cal_tab_info tr:nth-of-type(3) td {padding-bottom: 151px;}
	#cal_tab_info tr td:nth-of-type(2) {text-align: left;}
	table.calendar {
	 	width : 400px;
	    border: 1px solid silver;
	    display: inline-table;
	    text-align: center;
		border-collapse: collapse;
	}
	table.calendar tr:first-of-type{
		background : silver;
		height : 50px;
	}
	table.calendar td{
	    vertical-align: center;
	    width: 100px;
	}
	#select_info {
	  
	   text-align: center;
	   padding-bottom: 100px;
	}
	#select_info table {
	 	margin: auto;
	 	width : 1200px;
	 	border-collapse : collapse;
	    border: 2px solid black;
		border-left-color: white; 
		border-right-color: white;
	}
	#select_info table td{border-bottom: 1px solid silver;padding-bottom: 5px;}
	#select_info table td:nth-of-type(1){text-align: center;width: 10%;}
	#select_info table td:nth-of-type(2){text-align: left;width: 150px;}
	#select_info table td:nth-of-type(3){text-align: left;width: 20%;}
	#select_info table td:nth-of-type(4){text-align: right;}
	#select_info table tr:last-of-type td {border-bottom:none;}
	
	.reservationBtn {margin-top: 20px; padding: 10px; width: 300px; background-color: darkgray; color: white; font-weight: bold; border: none;}
   	.reservationBtn:hover, .sel .reservationBtn:focus{background-color: #353535; outline: none;} 
	
	.cal-schedule{
		text-align :center;
	}
	a{	
		text-decoration: none;
	 	 color: black;
	}
	.cal-day {
		width: 44px;
		height: 44px;
		margin : auto;
		line-height: 44px;
	}
	#reservation_room { 
		width: 130px;
		height: 100px;
	}
	.bookableList_backimg {
			width: 100%; 
			height: 750px;  
			background-size: cover;
			background-image: url("resources/assets/background_img/clock-691143_640.jpg"); 
			text-align: center; 
			color: white; 
			padding-top: 300px;
	}
		#pagetitle {font-size: 85px;}
		#hotelfive, #explain {font-weight: bold;}
		#explain {font-size: 15px;}
		#reservation_name {width: 280px;}

</style>
	
	<div class="bookableList_backimg">
		<h3 id="hotelfive">Hotel Five</h3>
		<h1 id="pagetitle">Reservation</h1>
		<p id="explain">좋은 시간을 보낼 호텔파이브 객실 예약</p>
	</div>
  <div class="cal_top">
  		<img id="reservation_name" alt="reservation_name" src="resources/assets/name_img/reservation_name.png"/>
  		<br/><br/> 
       <form>
          <input type="text" name="rCheckIn" id="rCheckIn" readonly placeholder="체크인"/>
          <input type="text" name="rCheckOut" id="rCheckOut" readonly placeholder="체크아웃"/>
          <input type="button" value="검색"  onclick="fn_go(this.form)" />
          <input type="button" value="취소"  onclick="fn_reset()" /> 
       </form>
       
    </div>
    <div id="info">
        
        <div id="cal" >
	     	<div id="cal_move">
	        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit"><i class="fas fa-arrow-left"></i></span></a>
	        <span id="cal_top_year"></span>.
	        <span id="cal_top_month"></span>
	        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit"><i class="fas fa-arrow-right"></i></span></a>
	     	</div>
	    	<div id="cal_tab" class="cal">
			</div>
        </div> 
		<div id="cal_tab_info">
			<h2 style="text-align: left">HotelFive 호텔</h2>
			<table style='background:lightgray;'>
			<tr>
				<td>문의전화</td>
				<td>02-123-4567</td>
			</tr>
			<tr>
				<td>결제안내</td> 
				<td>카드/무통장 (농협중앙회 302-0040-9885-71 (주)호텔파이브)</td>
			</tr>
			<tr>
				<td>특별기간</td>
				<td>
					준성수기 ( 2020-07-11 ~ 2020-07-24 )<br/>
					여름성수기 ( 2020-07-25 ~ 2020-08-08 )<br/>
					준성수기 ( 2020-08-09 ~ 2020-08-22 )<br/>
				</td>
			</tr>
			</table>
		
			
    </div>
    <div style="text-align: left;padding-top: 50px;">
     <h4>체크인 : <span style="color:red;">${rCheckIn } </span> 체크아웃 : <span style="color:red;">${rCheckOut }</span></h4>
     달력에서 체크인과 체크아웃을 선택, 검색하여 검색되는 객실을 선택 후 예약하기 버튼을 클릭하세요.<br/>
     리스트의 이미지를 선택하면 해당 객실의 정보페이지로 이동합니다.
    </div>
    </div>
    <div id="select_info" class="sel">
       <form>
       
		<c:if test="${rCheckIn ne null }">
       		<table >
	            <c:if test="${empty list }">
	               <tr>
	               		<td>
			              	 예약 가능한 방이 없습니다.
	               		</td>
	               </tr>
	            </c:if>
	            <c:if test="${not empty list }">
	               <c:forEach var="gDTO" items="${list }">
	                  <tr>	
	                  	<td>
	                   	 	 <input type="radio" name="gNo" value="${gDTO.gNo }"/> 
	                  	</td>
	                     <td>
	                     	 <a href="roomViewPage?gNo=${gDTO.gNo }&gName=${gDTO.gName}">
		                     	 <img id="reservation_room" alt="${gDTO.gName }" src="resources/assets/reservation_img/${gDTO.gNo }.jpg">
	                     	 </a>
	                     </td>
	                     <td>
	                   		  ${gDTO.gName }방 <br/>
	                   		  ${gDTO.gRoomSize }평형 [ ${gDTO.gMinPeople }명 / ${gDTO.gMaxPeople }명]
	                     </td>
	                     <td>
	                     	  ${gDTO.gPrice }원
	                     </td>
	                  </tr>
	               </c:forEach>
	            </c:if>
       		</table> 
		         <c:if test="${list eq null }">
		           	 <input class="reservationBtn" type="button" value="돌아가기"/>
		         </c:if>
		         <c:if test="${list ne null }">
			         	<input type="hidden" name="rCheckIn" value="${rCheckIn }"/>
			         	<input type="hidden" name="rCheckOut" value="${rCheckOut }"/>
			            <input class="reservationBtn" type="button" value="예약하기" onclick="fn_reservation(this.form)"/>
		         </c:if>         
		</c:if>
      </form>
    </div>
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var count = null;
    var checkinBtn1 = false;
    var checkinBtn2 = false;
    var checkInDate = null;
    var checkinDay =null
    var checkOutDay =null
  	var rCheckIn = '${rCheckIn}';
  	var rCheckOut = '${rCheckOut}';
 	var list = '${list}';
  	var first = true;
    var check_today = new Date();
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th style="color:red">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th style="color:blue">토</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="50">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td id="day_check" onclick="fn_du(this)" style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                //setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
        
    }
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
           if(rCheckOut == ''){          
           today = new Date();
           }else {
           today = new Date(rCheckOut);
           }
        
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
      
        
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
          //  $tdSche.eq(i).text(dayCount);
          
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
       if ( rCheckIn != '' && rCheckOut != ''  )    {
          
          if (new Date(rCheckIn).getMonth() == new Date(rCheckOut).getMonth() && month == new Date(rCheckIn).getMonth()+1){
             for (var i=new Date(rCheckIn).getDate();i<=new Date(rCheckOut).getDate();i++){
               $(day_check).eq(i+firstDay.getDay()-1).css("background","skyblue");
               $tdDay.eq(i+firstDay.getDay()-1).css("background","skyblue");
            }
            //$tdSche.eq(new Date(rCheckIn).getDate()+firstDay.getDay()-1).html('<i class="fas fa-check fa-2x"></i>');        
            // $tdSche.eq(new Date(rCheckOut).getDate()+firstDay.getDay()-1).html('<i class="fas fa-check fa-2x"></i>');
          }else if ( month == new Date(rCheckOut).getMonth()+1){
             for (var i=firstDay.getDay();i<=new Date(rCheckOut).getDate()+firstDay.getDay()-1;i++){
               $(day_check).eq(i).css("background","skyblue");
               $tdDay.eq(i).css("background","skyblue");
            }
            // $tdSche.eq(new Date(rCheckOut).getDate()+firstDay.getDay()-1).html('<i class="fas fa-check fa-2x"></i>');
          }else if ( month == new Date(rCheckIn).getMonth()+1){
             for (var i=new Date(rCheckIn).getDate();i<=lastDay.getDate();i++){
               $(day_check).eq(i+firstDay.getDay()-1).css("background","skyblue");
               $tdDay.eq(i+firstDay.getDay()-1).css("background","skyblue");
            //   $tdSche.eq(new Date(rCheckIn).getDate()+firstDay.getDay()-1).html('<i class="fas fa-check fa-2x"></i>');
            }
          }else if ( new Date(rCheckIn).getMonth()+1 < month && month < new Date(rCheckOut).getMonth()+1 ){
               for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
                $(day_check).eq(i).css("background","skyblue");
                $tdDay.eq(i).css("background","skyblue");
                  }
          }
             
         $('#rCheckIn').val(rCheckIn);
         $('#rCheckOut').val(rCheckOut);
         checkinBtn1 = true;
          checkinBtn2 = true;

      }
        
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $(day_check).eq(i).css('background','white').css('color','black');
            $tdDay.eq(i).css('background','white').css('color','black');
            $tdDay.eq(i).text("");
            $tdSche.eq(i).css("background","");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    
    function fn_go(f) {
      f.action="selectBookable";

      f.submit();
    }
    
    function fn_reservation(f){
        
    	
    	if(f.gNo.value==''){
    		alert('객실을 선택해주세요.');
    		return;
    	}
    	
    	var loginDTO_mId = '${loginDTO.mId}';
    	if (loginDTO_mId == '') {
			if (confirm('비회원으로 예약하시겠습니까?')) {
				f.action = 'reservationPage';
			} else {
				aa();
				return;
			}
    	} else {
        	f.action = 'reservationPage';	
    	}
        f.submit();
     }
     function fn_goViewPage(f){

        location.href='roomViewPage?gNo='+f.gNo.value;
     
     }
   
    
   
    function fn_reset() {
      checkinBtn1 = false;
      checkinBtn2 = false;
      $('#rCheckIn').val('');
       $('#rCheckOut').val('');
       rCheckIn = '';
       rCheckOut = '';
      getNewInfo();
   }
   
   function fn_du(f) {
   var text = f.innerHTML;
   var pos1 = text.indexOf('>');
   var pos2= text.indexOf('</div>');
    pos1 = pos1 + 1;
      var checkDay =  text.substring(pos1,pos2);
      
	    var checkDate = new Date(year+"-"+month+"-"+text.substring(pos1,pos2));
	      if (checkDate < check_today){
	    	  alert("지난 날 및 당일은 예약이 불가능합니다.");
	    	  return;
	      }
   if(checkDay != ''){
       if (!checkinBtn1){
             $('#rCheckIn').val(year+"-"+month+"-"+text.substring(pos1,pos2));
             checkinBtn1=true;
            checkInDate = checkDate;
            checkInDay =  checkDay;
            //$tdSche.eq(firstDay.getDay()+Number(checkDay)-1).html('<i class="fas fa-check fa-2x"></i>');
            //$tdSche.eq(firstDay.getDay()+Number(checkDay)-1).css('background','black');
            //$(day_check).eq(firstDay.getDay()+Number(checkDay)-1).css("background","black").css("color","white").css("borderRadius","400px");
             $tdDay.eq(firstDay.getDay()+Number(checkDay)-1).css("background","black").css("color","white").css("borderRadius","400px");
          }else if(!checkinBtn2) {
              var diff = checkDate.getTime() - checkInDate.getTime();
              diff = Math.ceil(diff / (1000 * 3600 * 24));
            
             if ( diff > 0){
             $('#rCheckOut').val(year+"-"+month+"-"+text.substring(pos1,pos2)) ;
             checkOutDay =  checkDay;
             checkinBtn2=true;
            //$tdSche.eq(firstDay.getDay()+Number(checkDay)-1).html('<i class="fas fa-check fa-2x"></i>');
            //$(day_check).eq(firstDay.getDay()+Number(checkDay)-1).css("background","black").css("color","white").css("borderRadius","400px");
             $tdDay.eq(firstDay.getDay()+Number(checkDay)-1).css("background","black").css("color","white").css("borderRadius","400px");
         
             }else {
                alert('체크아웃 날짜 오류');
             }
          }
      }else {
         alert('x');
      }
   }
</script>

<!-- 정적인 페이지 포함 -->
<%@ include file="/WEB-INF/views/template/footer.jsp" %>