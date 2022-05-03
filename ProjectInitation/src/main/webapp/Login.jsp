<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<form action="LoginService" method="post">
		<table>
			<tr>
				<td>ID : <input type="text" name="m_id"></td>
			</tr>
			
			<tr>
				<td>PW : <input type="password" name="m_pw"></td>
			</tr>
			
			<tr>
				<td><button type="submit" name="login" >로그인</button>
					<button type="button" name="cancel" onclick="location.href='Main.jsp'">취소</button>
					<button type="button" name="join" onclick="location.href='Join.jsp'">회원가입</button>
				</td>
			</tr>
		</table>
	</form>
<% 
	String errMsg = (String)session.getAttribute("errMsg");
	if(errMsg == null) errMsg=" ";
	
	session.invalidate();
%>
	<div id="errMsg" style="color:red"><%=errMsg %></div>
	
</body>
</html>