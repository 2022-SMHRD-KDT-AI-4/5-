<%@page import="xe.smhrd.model.InviteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Come On Yo</title>
    <link rel="stylesheet" type="text/css" href="assets/css/mypartylist.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/css/images/icon.png">
    <style type="text/css">
        @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
        html,body{width: 100%;height: 100%}
        body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,
        input,textarea,button,select{margin: 0;padding: 0}
        body,input,textarea,select,button,table{font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size: 12px;}
        img,fieldset{border: 0;}
        ul,ol{list-style: none;}
        em,address{font-style: normal;}
        a{text-decoration: none;}
        a:hover,a:active,a:focus{text-decoration: underline;}
    </style>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="assets/base.js"></script>
</head>
<body id="my-info">
<%
	List<InviteVO> mylist = (List<InviteVO>) session.getAttribute("mylist");
%>
<div class="my-page">
    <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
</div>

<div class="wrap">
	<h1>나의 Party 모아보기</h1>
	<div class="fixed_img_col">
		<ul>
			<% for (InviteVO ivo : mylist){%>
				<li>
					<a href="MyViewService?v_id=<%=ivo.getV_id()%>">
						<span class="thumb">
							<img src="img/<%=ivo.getP_img() %>" alt="<%=ivo.getP_name() %>" width="500" height="500">
	                        <em><%=ivo.getV_name() %></em>
	                    </span>
	                </a>
				</li>
			<%} %>
		</ul>
	</div>
</div>

<button class="top">
	<img src="assets/images/conged.png" alt="top button">
</button>

</body>
</html>