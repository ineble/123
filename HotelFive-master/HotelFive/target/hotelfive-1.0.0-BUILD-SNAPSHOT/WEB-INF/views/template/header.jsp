<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	if(title == null || title.isEmpty()){
		title = "Welcome to the KoreaHotel";
	}
	pageContext.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>

<style type="text/css">
	* {
  		box-sizing: border-box;
	}
	body {
  		margin: 0;
  		padding: 0;
	}
	.header-wrap {
		position: absolute;
		top: 0;
		width: 100%;
		margin-top: 0;
  		background-color: rgb(250,250,250);
  		padding: 30px;
  		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  		position: fixed;
	}
	.header-wrap a {
  		float: left;
  		display: block;
  		color: rgb(150,150,150);
  		text-align: center;
  		padding: 16px 20px;
  		text-decoration: none;
  		margin-right: 10px;
  		border-radius: 15px;
	}
	.header-wrap > a:nth-child(1){
		font-size: 2.0em;
		font-weight: bold;
	}
	.header-wrap > a:nth-child(2){
		background-color: rgb(50,50,230);
		color: rgb(200,200,220);
		font-weight: bold;
		font-size: 1.1em;
		transition: all ease 1s;
	}
	.header-wrap > a:nth-child(2):hover{
		transform: scale( 0.9, 0.95 );
	}
	.header-wrap > a:nth-child(3){
		color: rgb(100,100,220);
		font-weight: bold;
		font-size: 1.1em;
	}
	.header-wrap a:hover {
  		background-color: rgb(150,180,220);
  		color: rgb(0,0,0);
	}
	.main-wrap {
		margin-top: 220px;
	}
	
	.footer-wrap {
		width: 100%;
  		height: 200px;
  		background-color: rgb(30,30,30);
  		position: fixed; 
  		left: 0; 
  		bottom: 20px;
  		z-index: -1;
	}
	.footer-wrap .footer-content{
		color: rgb(170,170,170);
    	column-count: 2;
    	column-gap: 40px;
    	font-weight: 300;
    	width: 900px;
  		margin: auto;
  		margin-bottom: 150px;
  		padding: 50px 0;
	}
	.footer-bottom{
		position: absolute;
		bottom: 0;
		height: 20px;
		width: 100%;
		text-align: center;
		color: rgb(220,220,220);
		background-color: rgb(60,60,60);
	}
	.dropbtn {
		background-color: rgb(250,250,250);
  		color: rgb(150,150,150);
  		padding: 16px;
  		font-size: 16px;
  		border: none;
  		border-radius: 15px;
  		margin-top: 3px;
	}
	.dropdown {
  		position: relative;
  		display: inline-block;
	}
	.dropdown-content {
  		display: none;
  		position: absolute;
  		background-color: rgb(230,230,230);
  		min-width: 150px;
  		box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  		z-index: 1;
	}
	.dropdown-content a {
		width: 100%;
  		color: black;
  		padding: 12px 16px;
  		text-decoration: none;
  		display: block;
	}
	.dropdown-content a:hover {background-color: rgb(200,200,200);}
	.dropdown:hover .dropdown-content {display: block;}
	.dropdown:hover .dropbtn {background-color: rgb(190,190,190);}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<div class="header-wrap">
  		<a href="main">KoreaHotel</a>
  		<a href="loginPage" style="float:right">LOGIN</a>
  		<a href="registerPage" style="float:right">REGISTER</a>
  		<div class="dropdown" style="float:right">
  			<button class="dropbtn">Board▼</button>
  			<div class="dropdown-content">
    			<a href="#">Notice Board</a>
    			<a href="#">QNA Board</a>
    			<a href="#">Review Board</a>
  			</div>
		</div>
  		<a href="#" style="float:right">MyPage</a>
  		<a href="#" style="float:right">Reservation</a>
 	    <a href="#" style="float:right">RoomInfo</a>
 	    <a href="#" style="float:right">AboutUs</a>
	</div>
	<div class="main-wrap">