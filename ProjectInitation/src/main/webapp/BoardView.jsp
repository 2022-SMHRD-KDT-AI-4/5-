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
	<thead>
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
                    <input type="button" value="찜하기" onclick="cartsave();">
                    <input type="button" value="찜빼기" onclick="cartdelete();">
                </td>
                 
            </tr>
        </tr>
    </table>
    </thead>
	</div>
	    <!-- 찜목록 영역 -->
    <div>		
    <%List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");%>
		
    	<h1>찜목록</h1>
    	<a href ="Invitepage.jsp" >초대장 작성하기</a>
		<a href='javascript:void(0);' onclick="cartclear();">찜목록 비우기</a>
		<table border="0">
		<tbody id="cart">	
		</tbody>
		</table>
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
	
	function cartsave(){
		$.ajax({
			url : 'CartService',
			type : 'post',
			dataType : "json",
			data : {
				"p_id" : "<%=bvo.getP_id()%>",
				"pt_id" : "<%=bvo.getPt_id()%>",
				"num" : "<%=bvo.getNum()%>",
				"action" : "save",
			},
			 success : function(res){
	               console.log("통신성공(세이브)");
	               clearcartlist();
	               setcartlist(res);
	               makecartlist();
	            },
	            error : function(){ alert('error!'); }
	         });
	}
	
	function cartdelete(){
		$.ajax({
			url : 'CartService',
			type : 'post',
			dataType : "json",
			data : {
				"p_id" : "<%=bvo.getP_id()%>",
				"pt_id" : "<%=bvo.getPt_id()%>",
				"num" : "<%=bvo.getNum()%>",
				"action" : "delete",
			},
			 success : function(res){
	               console.log("통신성공(딜리트)");
	               clearcartlist();
	               setcartlist(res);
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
/* 			console.log("추가리스트 : "+p_id[i],p_name[i],p_img[i]); */
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