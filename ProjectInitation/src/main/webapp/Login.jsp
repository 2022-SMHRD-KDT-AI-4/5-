<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="LoginService" method="post">
		ID : <input type="text" name="m_id"> <br>
		PW : <input type="password" name="m_pw"> <br>
		<input type="submit" value="로그인">
	</form>
</body>
</html>