<%@page import="java.util.List"%>
<%@page import="xe.smhrd.model.BoardVO"%>
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
	BoardVO bvo = (BoardVO) request.getAttribute("bvo");
	List<BoardVO> ilist = (List<BoardVO>) request.getAttribute("ilist");
	int maxnum = (int) request.getAttribute("maxnum");
	%>
	<div>
		<table border="1">
			<tr>
				<td rowspan="4"><img src="img/<%=bvo.getP_img()%>" style="max-width: 700px;"></td>
				<td align=center height=100px><h1><%=bvo.getP_name()%></h1></td>
			</tr>
			<tr>
				<td align=right height=10px>조회수 : <%=bvo.getP_view()%></td>
			</tr>
			<tr>
				<td>
					<%
					for (BoardVO vo : ilist) {
					%>
					<li><%=vo.getI_name()%></li> 
					<% } %>
				</td>
			</tr>
			<tr>
				<td align=center height=10px>
				
				<a href="CartService?p_id=<%=bvo.getP_id()%>
				&pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum()%>
				&action=delete"
				target = "Cartlist"
				style="float: left;">찜빼기</a>
				
				<a href="CartService?p_id=<%=bvo.getP_id()%>
				&pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum()%>
				&action=save"
				target = "Cartlist"
				style="float: right;">찜하기</a>
				
				</td>
			</tr>
			<tr>
				<td align=left>
					<%
					if (bvo.getNum() > 1) {
					%> <a
					href="ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() - 1%>"
					style="float: left;">이전</a> <%
 					} else { %>이전 <% } %>
				</td>
				<td align=right>
					<%
					if (bvo.getNum() < maxnum) {
					%> <a
					href="ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() + 1%>"
					style="float: right;">다음</a> 
					<% } else { %>다음 <% } %>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>