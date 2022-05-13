<%@page import="java.util.List"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="assets/css/BoardView.css">

</head>
<body>
<%
	BoardVO bvo = (BoardVO) request.getAttribute("bvo");
	List<BoardVO> ilist = (List<BoardVO>) request.getAttribute("ilist");
	int maxnum = (int) request.getAttribute("maxnum");
%>
	<div class="wrap">
    <table border-collapse:collapse; width="1200px">
        
        <tr bgcolor="pink" height="70px">
            <th id="th1"><%=bvo.getP_name()%></th>
            <th id="th2">조회수 : <%=bvo.getP_view()%></th>
        </tr>

        <tr align="center">
            <td id="content" rowspan="2">
                <img src="img/<%=bvo.getP_img()%>" alt="<%=bvo.getP_name()%>" width="700px" height="700px">
            </td>
        </tr>

        <tr height="650px">
                <td id="list">
                    <% for (BoardVO vo : ilist) { %>
					    <li><%=vo.getI_name()%></li> 
					<% } %>
                </td>
        </tr>

            <tr height="40px">
                <td id="button1"align="center">
                    <% if(bvo.getNum() > 1) { %>
                        <input type="button" value="Back" onClick="location.href='ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() - 1%>'"> 
                    <% } %>

                    <% if(bvo.getNum() < maxnum) { %>
                        <input type="button" value="Next" onclick="location.href='ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() + 1%>'">
                    <% } %>
                </td>
                <td id="button2" align="center">
                    <input type="button" value="찜하기" onClick="location.href='CartService?p_id=<%=bvo.getP_id()%>&pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum()%>&action=save'" target = "Cartlist">
                    <input type="button" value="찜빼기" onClick="location.href='CartService?p_id=<%=bvo.getP_id()%>&pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum()%>&action=delete'" target = "Cartlist">
                </td>
                 
            </tr>
        </tr>
    </table>
    </div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<%-- 	
	<div>
		<table border="1">
			<tr>
				<td rowspan="4">
					<img src="img/<%=bvo.getP_img()%>" style="max-width: 700px;">
				</td>
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
					<% if (bvo.getNum() > 1) { %>
					<a href="ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() - 1%>"
					style="float: left;">이전</a> 
					<% } else { %>
						이전
					<% } %>
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
	</div> --%>
</body>
</html>