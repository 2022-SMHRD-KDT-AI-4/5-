<%@page import="xe.smhrd.model.InviteVO"%>
<%@page import="java.util.List"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="xe.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width initial scale 1.0">
	<meta name="p:domain_verify" content="5106e0d8c90f98f5675e3292a49d07b5" />
	<title>Happy</title>
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main_m.css" media="only screen and (max-width:910px)">
	<link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png" />
	<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="assets/base.js"></script>
</head>

<body id="main-screen">

<%
	MemberVO mvo = (MemberVO) session.getAttribute("vo");

%>
	<nav class="privacy">
	<%if (mvo == null) {%>
		<div class="icons">
			<a class="login-icon" href="Login.jsp?uri=Main">login</a>
			<a class="join-icon" href="Join.jsp">join</a>
		</div>
	<%} else {%>
		<div class="icons">
			<a class="logout-icon" href="LogoutService">logout</a>
		</div>
	<%}%>
	</nav>

	<section id="header">

		<div class="header">
			<a href="Main.jsp"><img src="assets/images/mainlogo.png" alt="logo"></a>
		</div>

		<nav class="main-menu">
			<h2 class="hidden">카테고리</h2>
		
			<ul class="menu">
				<li>
					<a href="MyPartylist.jsp">My List</a>
				</li>

				<li>
					<a href="use.jsp">how to use</a>
			</ul>
		</nav>

<%
	BoardVO vo = (BoardVO) request.getAttribute("vo");
%>
<!--메인 사진 클릭하는 부분-->
		<div id="wrap">
			<article>
			<a href="BoardP.jsp?pt_id=bridal"><img src="assets/images/mainbridal.png" alt="bridal"></a>
			</article>
			<article>
			<a href="BoardP.jsp?pt_id=birth"><img src="assets/images/mainbirth.png" alt="birth"></a>
			</article>
			<article>
			<a href="BoardP.jsp?pt_id=xmas"><img src="assets/images/mainxmas.png" alt="xmas"></a>
			</article>
			<article>
			<a href="BoardP.jsp?pt_id=halloween"><img src="assets/images/mainhallo.png" alt="halloween"></a>
			</article>
			<article>
			<a href="BoardP.jsp?pt_id=baby"><img src="assets/images/mainbaby.png" alt="baby"></a>
			</article>
			
			<article>
			<table width="579">
				<tr height="579">
					<td style="vertical-align: bottom; text-align:right" >
	  					인공지능 융합서비스 개발자과정 11회차<br><br>
	                    Copyrights &copy; 2022 <br><br>
	                    Team. 5-micron<br><br>
	                    All Rights Reserved.<br><br><br>
	                </td> 
				</tr>
			</table>
			</article>
		</div>
		<!--5월 10일 21시까지 추가한 부분-->
		<button class="top">
			<img src="assets/images/conged.png" alt="top button">
		</button>

	</section>


</body>
</html>