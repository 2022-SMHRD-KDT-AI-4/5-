<%@page import="xe.smhrd.model.BoardDAO"%>
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

	<form action="InviteService" method="post">
		<div>
			<table>
				<tr>
					<td>파티이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>파티일자</td>
					<td><input type="date" name="date"></td>
				</tr>
				<tr>
					<td>개최지</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2"><textarea name="content" rows="10"></textarea>
					</td>
				</tr>
				<tr>
				</tr>
			</table>
	</div>
	<div>
		<%
		List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");
		BoardDAO dao = new BoardDAO();
		if (cartList == null) {
		%>찜목록이 비었습니다<%
		} else {
		%><table border="1">
			<%
			for (BoardVO bvo : cartList) {
			%>
			<tr>
				<td rowspan="3"><img src="img/<%=bvo.getP_img()%>"
					style="width: 300px;"></td>
				<td align=center><%=bvo.getP_name()%></td>
			</tr>
			<tr>
				<td>
					<%
					List<BoardVO> ilist = dao.selectPartyItemList(bvo.getP_id());
					for (BoardVO ivo : ilist) {
					%>
					<li><%=ivo.getI_name()%></li> <%
 }
 %>

				</td>
			</tr>
			<tr>
				<td>대표이미지로 설정 <input type="radio" name="p_id" value="<%=bvo.getP_id()%>"></td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		}
		%>

	</div>

<BR>
					<td colspan="2"><input type="reset" value="초기화"> <input
						type="submit" value="작성하기"></td>
	</form>
</body>
</html>