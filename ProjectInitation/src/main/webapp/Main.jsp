<%@page import="xe.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial scale 1.0">
<meta name="p:domain_verify" content="5106e0d8c90f98f5675e3292a49d07b5" />
<title>shine drop</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/main_t.css" media="only all and (max-width:1297px)">
<link rel="stylesheet" type="text/css" href="assets/css/main_m.css" media="only screen and (max-width:910px)">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="assets/base.js"></script>


<!--[if lt IE 9]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<body>

	<section id="header">
	<h1>
		<a href="assets/index.html"><img src="assets/images/logo_s.png"
			alt="paing drop"></a>
	</h1>
	<nav>
	<h2 class="hidden">카테고리</h2>
	<ul class="gnb">
		<li><a href="#header">HOME</a></li>
		<li><a href="assets/chris.html">X-mas</a></li>
		<li><a href="assets/ween.html">Halloween</a></li>
		<li><a href="assets/bridal.html">Bridal</a></li>
		<li><a href="assets/birth.html">B-day</a></li>
		<li><a href="assets/invite.html">초대장</a></li>
		<li><a href="assets/informa.html">홈페이지 정보</a></li>

	</ul>
	</nav>\
<%
 MemberVO vo = (MemberVO) session.getAttribute("vo");
 out.print(vo);
%>

	<div class="mnb">
		<button>
			<img src="assets/images/mnb.png" alt="더보기 메뉴">
		</button>
		<ul class="mnb_inner">
			<%if (vo == null) {%>
			<li><a href="Login.jsp">로그인</a></li>
			<li><a href="Join.jsp">회원가입</a></li>
			<%} else {%>
			<li><h3><%=vo.getM_name()%>님</h3></li>
			<li><a href="mypage">마이페이지</a><li>
			<li><a href="LogoutService">로그아웃</a><li>
			<%}%>
		</ul>
	</div>


	<button class="top">
		<img src="assets/images/top.png" alt="top button">
	</button>

	</section>

	<section class="visual"> </section>

	<%
	if (vo == null) {
	%>
	<a href="Login.jsp">로그인</a>
	<br>
	<a href="Join.jsp">회원가입</a>
	<br>
	<%
	} else {
	%>
	<h3><%=vo.getM_name()%>님
	</h3>
	<a href="mypage">마이페이지</a>
	<br>
	<a href="LogoutService">로그아웃</a>
	<br>
	<%
	}
	%>

</body>
</html>