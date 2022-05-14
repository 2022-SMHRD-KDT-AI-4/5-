<%@page import="xe.smhrd.model.InviteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>당신을 초대</title>
    <link rel="stylesheet" type="text/css" href="assets/css/MypartyView.css">
    <style type="text/css">
        table, th, td{
            border: 1px solid black;
        }
    </style>
</head>
<body>
<%
	InviteVO myvo = (InviteVO) session.getAttribute("myvo");
	List<InviteVO> myitemlist = (List<InviteVO>) session.getAttribute("myitemlist");
%>
<form action="MyResultService?v_id=<%=myvo.getV_id()%>" method="post">
<div class="wrap">
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border-collapse:collapse; width="1200px">
		<tr height="20px" id="head">
			<th id="th1">대표이미지</th>
            <th id="th2">사용할 아이템 목록</th>
		</tr>
		
	<tr align="center">
		<td id="images">
			<img src="img/<%=myvo.getP_img() %>"  width="100%" height="100%">
		</td>
	
		<td align="left">
			<%for(InviteVO ivo : myitemlist){ %>
				<li><%=ivo.getI_name() %></li><br>
			<%} %>
		</td>
	</tr>
	
	<tr height="40px">
        	<td id="date"align="center">
                개최일자 :  <%=myvo.getV_date()%>
            </td>
            <td id="spot" align="center">
                장소 : <%=myvo.getV_adr()%>
            </td>
	</tr>
	
	</table>
</div>
</form>
</body>
</html>