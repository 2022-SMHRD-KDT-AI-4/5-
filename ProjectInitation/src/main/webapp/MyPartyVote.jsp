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
	InviteVO myvo = (InviteVO) session.getAttribute("myvo");
	List<InviteVO> myitemlist = (List<InviteVO>) session.getAttribute("myitemlist");
	%>
<form action="VoteService?v_id=<%=myvo.getV_id()%>" method="post">
<div>
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border="1">
	<tr>
	<td>
	대표이미지
	</td>
	<td>
	파티에서 쓰고 싶은 아이템을 선택해주세요
	</td>
	</tr>
	<tr>
	<td>
	<img src="img/<%=myvo.getP_img() %>" style="max-width: 700px;">
	</td>
	<td>
		<%for(InviteVO ivo : myitemlist){
			%>
			<li><%=ivo.getI_name() %>
			<input type="checkbox" name="seli_id" value="<%=ivo.getI_id()%>"></li><br>
			<%	}%>
	</td>
	</tr>
	</table>
	
</div>
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr() %><br>
<br>
<input type="submit" value="아이템 추천투표하기">
 <input type="reset" value="초기화">
 </form>
</body>
</html>