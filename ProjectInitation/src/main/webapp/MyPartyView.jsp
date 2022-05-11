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
<<<<<<< HEAD
<div>
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border="1">
	<tr>
	<td>
	대표이미지
	</td>
	<td>
	사용될 아이템 목록
	</td>
	<td>
	추천수
	</td>
	<td>
	최종 선택
	</td>
	</tr>
	<tr>
	<td>
	<img src="img/<%=myvo.getP_img() %>" style="max-width: 700px;">
	</td>
	<td>
		<%for(InviteVO ivo : myitemlist){
			%>
			<li><%=ivo.getI_name() %></li><br>
			<%	}%>
	</td>
	<td>
	<%for(InviteVO ivo : myitemlist){
			%>
			<%=ivo.getSel_g() %><br><br>
			<%	}%>
	</td>
	</tr>
	</table>
	
</div>
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr() %><br>
<br>
<a href="MyVoteService?v_id=<%=myvo.getV_id()%>">파티에 사용할 아이템 추천 받기</a><br>
<a>최종안 결정</a>
=======
	<form action="MyResultService?v_id=<%=myvo.getV_id()%>" method="post">
<div>
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border="1">
	<tr>
	<td>
	대표이미지
	</td>
	<td>
	사용될 아이템 목록
	</td>
	<td>
	추천수
	</td>
	<td>
	최종 선택
	</td>
	</tr>
	<tr>
	<td rowspan="<%=myitemlist.size()%>">
	<img src="img/<%=myvo.getP_img() %>" style="max-width: 700px;">
	</td>
		<%for(InviteVO ivo : myitemlist){ %>
		<td>
			<li><%=ivo.getI_name() %></li>
			</td><td>
			<%=ivo.getSel_g() %>
			</td><td>
			<input type="checkbox" name="seli_id" value="<%=ivo.getI_id()%>">
			</td><tr>
			<%	}%>
	</td>
	</tr>
	</tr>
	</table>
	
</div>
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr()%><br>
<a href="MyVoteService?v_id=<%=myvo.getV_id()%>">파티에 사용할 아이템 추천 받기</a><br>
<input type="submit" value="초대장 최종안 결정한기">
 <input type="reset" value="선택 초기화">
  </form>
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-AI-4/5micron.git

</body>
</html>