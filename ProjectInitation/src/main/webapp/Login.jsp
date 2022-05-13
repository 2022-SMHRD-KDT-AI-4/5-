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
<%
	String errMsg = (String) session.getAttribute("errMsg");
	if (errMsg == null)
		errMsg = " ";

	session.invalidate();
%>
    <div class="login-sys" >
        <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
    </div>

<div class="login-page">
    <div class="form">

        <form class="login-form" action="LoginService" method="post">
        	<div id="errMsg" style="color: red"><%=errMsg%></div>
            <input type="text" name="m_id" placeholder="id"/>
            <input type="password" name="m_pw" placeholder="password"/>
            <button type="submit" name="login" >login</button>
            <button type="button" name="cancel" onclick="location.href='Main.jsp'">cancel</button>
            <p class="message">Not registered? <a href="Join.jsp">Create an account</a></p>
        </form>

    </div>
</div>

</body>

</html>