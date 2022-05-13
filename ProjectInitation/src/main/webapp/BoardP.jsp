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
    <link rel="stylesheet" type="text/css" href="assets/css/BoardP.css">
    <link rel="stylesheet" type="text/css" href="assets/css/sideheart.css">
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

<body id="board">
<div class="board_header">
	<a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
</div>
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
                            		<em style="font-size: 45px;">클릭하여 자세히 보기</em>
                        		</span>
                        		<strong><%=vo.getPt_name() + bvo.getNum()%></strong>
                    		</a>
                		</li>
                <%} %>
            </ul>
        </div>
    </div>
    
<!-- 찜목록 영역 -->
    <div class="outer-div">		
    <%List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");%>
		<div class="title">
        <h3>찜 목록</h3>
        </div>
    	<div class="inner-div">
    	<table border="0">
    	<tbody id="cart">
    	</tbody>
		</table>
		</div>
		<div class="button">
		<input type="button" onclick="cartclear();" value="찜목록 비우기">
        <input type="button" onclick = "location.href = 'Invitepage.jsp'" value="작성하기">
		</div>
    </div>
    <!-- 찜목록 영역 끝 -->
    
    <!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	let p_id = [];
	let p_name = [];
	let p_img = [];
	<% if (cartList != null) {
		for (BoardVO cvo : cartList) {	%>
		p_id.push('<%=cvo.getP_id()%>');
		p_name.push('<%=cvo.getP_name()%>');
		p_img.push('<%=cvo.getP_img()%>');
		<% } }%>
	console.log(p_id,p_name,p_img);
	$(document).ready(function() {
		console.log("시작");
		makecartlist(); 
	})
	
	

	function cartclear(){
		$.ajax({
			url : 'CartClearService',
			type : 'post',
			success : function(res){
				console.log("통신성공");	
				clearcartlist();				
				makecartlist();
				},
	            error : function(){ alert('error!'); }
		});
	}
	
	function setcartlist(res){
	console.log("리스트 채움");
	for (var i = 0; i < res.length; i++){
		p_id.push(res[i].p_id);
		p_name.push(res[i].p_name);
		p_img.push(res[i].p_img);
 	  }
	}
	
	function clearcartlist(){
		console.log("리스트 비우고 새로 작성");
		p_id = [];
		p_name = [];
		p_img = [];
		$('#cart').html('');	//리스트 일괄삭제
	}
	
	function makecartlist(){	
		console.log("리스트 작성 시작");	
		for (var i = 0; i < p_id.length; i++){
 			console.log("추가리스트 : "+p_id[i],p_name[i],p_img[i]);
			 tr = `
                <tr>
				 	<td width="250px"><center>
						<img src="img/`+p_img[i]+`" width="250px">
					</center></td>
				</tr>
				<tr>
					<td><center>
							`+p_name[i]+`
					</center></td>
                 </tr>
              `;
			 $('#cart').append(tr);
		}
	}
	</script>
</body>
</html>