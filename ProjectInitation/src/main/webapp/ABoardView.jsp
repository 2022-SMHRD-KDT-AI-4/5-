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
	List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
	int num = (int) request.getAttribute("num");
	%>
	<div id = "board">
				<table id="list" border="1" >
					<tr>
						<td rowspan="3">
						<img src="img/<%=bvo.getP_img() %>"></td>
						<td  height=100><h1><%=num%>.<%=bvo.getP_name() %></h1></td>
					</tr>
					<tr>
						<td><%-- 
							<%
							for (BoardVO vo : list) {
							%>
							<li><%=vo.getI_name()%></li>
							<%}%> --%>
						</td>
					</tr>
					<tr>
					<td>
					<a>찜하기</a>
					</td>
					</tr>
					<tr>
					<td colspan="2">
					<a href="href=ViewService?p_id=&num=<%= num-1%>" style="float: left;">이전</a>
					<a style="float: right;">다음</a>
					</td>
					</tr>
				</table>
			</div>

</body>
</html>