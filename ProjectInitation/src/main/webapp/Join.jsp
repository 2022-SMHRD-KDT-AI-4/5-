<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="JoinService" method="post">
		ID : <input type="text" name="m_id"> <br> 
		PW : <input type="password" name="m_pw"> <br>
		NICK : <input type="text" name="m_name"> <br>
		<input type="submit" value="회원가입">
	</form>
</body>
</html>