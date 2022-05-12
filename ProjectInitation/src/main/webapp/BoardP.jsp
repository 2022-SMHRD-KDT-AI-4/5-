<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="xe.smhrd.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="assets/css/detailpage.css">
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
</head>

<body>
	<%
	List<BoardVO> list = (List<BoardVO>) request.getAttribute("plist");
	BoardVO vo = (BoardVO) request.getAttribute("pvo");
	%>
    <div class="wrap">
        <h1><%=vo.getPt_name() %> 한 눈에 보기</h1>
        <div class="fixed_img_col">
            <ul>
            	<% for (BoardVO bvo : list) {%>
                <li>
                    <a href="ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum()%>">
                        <span class="thumb">
                            <img src="img/<%=bvo.getP_img() %>" alt="<%=bvo.getP_name() %>" width="500" height="700">
                            <em>클릭하여 자세히 보기</em>
                        </span>
                        <strong><%=vo.getPt_name() + bvo.getNum()%></strong>
                    </a>
                </li>
                <%} %>

            </ul>
        </div>
    </div>
</body>
</html>