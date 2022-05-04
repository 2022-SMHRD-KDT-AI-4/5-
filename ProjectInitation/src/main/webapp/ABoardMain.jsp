<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="xe.smhrd.model.BoardDAO"%>
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
	List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
	%>
	<div id="board">
		<table id="list" border=1>
			<thead>
				<tr>
					<td>파티분류</td>
					<td>파티이름</td>
				</tr>
			</thead>
			<tbody>
				<%
				for (BoardVO bvo : list) {
				%>
				<tr>
					<td><%=bvo.getPt_id()%></td>
					<td><a href="ViewService?p_id=<%=bvo.getP_id()%>"><%=bvo.getP_name()%></a></td>
				</tr>
				<%
				}
				%>

			</tbody>

		</table>

		<a href="IABoardWrite.jsp"><button id="writer">작성하러가기</button></a>
	</div>

</body>
</html>