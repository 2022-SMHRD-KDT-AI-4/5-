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
	<h1>파티종류보기</h1>
		<table id="list" border=1>
			<thead>
			</thead>
			<tbody>
				<%
				int i = 1;
				for (BoardVO bvo : list) {
				if(i%2==1){
				%>
				<tr>
				<%} %>
					<td>
					<table>
						<tr>
						<td><center>
							<img src="img/bono.png">
							</center>
						</td>
					</tr>
					<tr>
					<td><center>
						<a href="ListService?pt_id=<%=bvo.getPt_id()%>"><%=bvo.getPt_name()%></a>
						</center>
						</td>
					</tr>
					</td>
				<%if(i%2==1){
				%>
				</tbody>
				<%} %>
				</table>
				<%
				i++;
				}
				%>

			</tbody>

		</table>

	</div>

</body>
</html>