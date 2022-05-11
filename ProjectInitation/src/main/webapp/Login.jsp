<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width initial scale 1.0">
<meta name="p:domain_verify" content="5106e0d8c90f98f5675e3292a49d07b5" />
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/main_m.css" media="only screen and (max-width:910px)">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="assets/base.js"></script>

</head>
<body>
    <div class="login-sys" >
        <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
    </div>

<div class="login-page">
    <div class="form">

        <form class="login-form" action="LoginService" method="post">
            <input type="text" name="m_id" placeholder="id"/>
            <input type="password" name="m_pw" placeholder="password"/>
            <button type="submit" name="login" >login</button>
            <button type="button" name="cancel" onclick="location.href='Main.jsp'">cancel</button>
            <p class="message">Not registered? <a href="Join.jsp">Create an account</a></p>
        </form>

    </div>
</div>
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if (errMsg == null)
		errMsg = " ";

	session.invalidate();
%>
	<div id="errMsg" style="color: red"><%=errMsg%></div>

</body>
<%-- <body>
	<h1>로그인</h1>
	<p>서비스를 이용하기 위해서는 로그인이 필요합니다.</p>
	<form action="LoginService" method="post">
		<table>
			<tr>
				<td>ID : <input type="text" name="m_id"></td>
			</tr>

			<tr>
				<td>PW : <input type="password" name="m_pw"></td>
			</tr>

			<tr>
				<td><input type="submit" name="login" value="로그인"> <input
					type="button" name="cancel" value="취소"
					onclick="location.href='Main.jsp'"> <!-- <button type="submit" name="login" >로그인</button>
					<button type="button" name="cancel" onclick="location.href='Main.jsp'">취소</button> -->
				</td>
			</tr>
		</table>
	</form>
	<%
	String errMsg = (String) session.getAttribute("errMsg");
	if (errMsg == null)
		errMsg = " ";

	session.invalidate();
	%>
	<div id="errMsg" style="color: red"><%=errMsg%></div>

</body> --%>
</html>