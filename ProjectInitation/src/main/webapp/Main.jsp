<%@page import="xe.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberVO vo = (MemberVO) session.getAttribute("vo");
	out.print(vo);
%>
	
	<h1>메인 페이지 입니다.</h1>
	<%if(vo == null){ %>
		<a href="Login.jsp">로그인</a><br>
		<a href="Join.jsp">회원가입</a><br>
	<%}else{ %>
		<h3><%=vo.getM_name() %>님</h3>
		<a href="mypage">마이페이지</a><br>
		<a href="LogoutService">로그아웃</a><br>
	<%} %>
	
	
</body>
</html>