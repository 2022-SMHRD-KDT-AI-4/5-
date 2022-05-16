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
    <title>Come On Yo</title>
    <link rel="stylesheet" type="text/css" href="assets/css/MypartyView.css">
    <link rel="stylesheet" type="text/css" href="assets/css/popup.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png"/>
    <style type="text/css">
        table, tr, th, td{
            border: 3px solid #FFC99A;
            font-size: 20px;
        }
    </style>
</head>
<body id="de-info">
<%
	InviteVO myvo = (InviteVO) session.getAttribute("myvo");
	List<InviteVO> myitemlist = (List<InviteVO>) session.getAttribute("myitemlist");
%>
<div class="de-page">
	<img src="assets/images/logoda.png" alt="">
</div>

<div class="wrap">
	<h1>초대장 결과</h1><br>
	<h1><%=myvo.getV_name() %></h1><br>
	<h5><%=myvo.getV_cont() %></h5><br>
	<div id="col-de">
		<ul id="de-ul">
			<table border-collapse:collapse; width="1200px">
				<tr height="20px" id="head">
					<th id="th1">대표이미지</th>
		            <th id="th2">사용할 아이템 목록</th>
				</tr>
				
				<tr align="left">
					<td id="images">
						<img src="img/<%=myvo.getP_img() %>"  width="100%" height="100%">
					</td>
			
					<td align="center" width="200px" height="300px">
						<%for(InviteVO ivo : myitemlist){ %>
							<li>
								<%=ivo.getI_name() %>
							</li><br>
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
		</ul>
	</div>
</body>
</html>