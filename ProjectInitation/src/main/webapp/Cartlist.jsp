<%@page import="java.util.ArrayList"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>찜목록</h1>
		<%
		List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");
		if (cartList == null) {
			%>찜목록이 비었습니다<%
		}else{
		%>
		<table border="1">
		<thead>
		</thead>
		
		<tbody>
			<% 
			for (BoardVO cvo : cartList) {
				%>
				<tr>
					<td>
					<table>
						<tr>
						<td width = "260px"><center>
							<img src="img/<%=cvo.getP_img() %>" width = "260px">
							</center>
						</td>
					</tr>
					<tr>
					<td><center>
						<%=cvo.getP_name() %>
						</center>
						</td>
					</tr>
					</table>
					</td>
					</tr>
					<%}} %>
				</table>

			</tbody>
</body>
</html>