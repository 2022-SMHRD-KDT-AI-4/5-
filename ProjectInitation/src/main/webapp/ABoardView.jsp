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
	%>
	<div id = "board">
				<table id="list" border="1" >
					<!-- <tr>
						<td>파티이름</td>
						<td>
						<%=bvo.getP_name() %>
						</td>
					</tr>
					<tr>
						<td colspan="2">설명</td>
						</tr>
						<tr>
						<td colspan="2">
						<%=bvo.getP_cont().replace("\n", "<br>") %>
						</td>
						</tr>
					<tr>
						<td colspan="2">
						<img src="img/<%=bvo.getP_img() %>">
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="ListService"><button>뒤로가기</button></a></td>
					</tr> -->
					<tr>
						<td rowspan="2">
						<img src="img/<%=bvo.getP_img() %>"></td>
						<td  height=100><h1><%=bvo.getP_name() %></h1></td>
					</tr>
					<tr>
						<td>
							<%
							for (BoardVO vo : list) {
							%>
							<li><%=vo.getI_name()%></li>
							<%
							}
							%>
						</td>
					</tr>
				</table>
			</div>

</body>
</html>