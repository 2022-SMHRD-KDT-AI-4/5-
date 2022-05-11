<%@page import="xe.smhrd.model.InviteVO"%>
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
<%
List<InviteVO> mylist = (List<InviteVO>) session.getAttribute("mylist");
	%>
<div>
		<h1>나의 파티목록</h1>
		<table border = "1">
		<%int i = 1;
		for (InviteVO ivo : mylist){
			if(i%3==1){
				%>
				<tr>
				<%} %>
				<td>
				<table>
			<tr>
			<td>
			<img src="img/<%=ivo.getP_img() %>" width="300px">
			</tr>
			</td>
			<tr>
			<td>
			<a href="MyViewService?v_id=<%=ivo.getV_id()%>"><%=ivo.getV_name() %></a>
			</td>
			</tr>
			</table>
			</td>
				<%if(i%3==0){%>
				</tr>
				<%}
				i++;
				%>
			<%} %>
		</table>
		</div>

</body>
</html>