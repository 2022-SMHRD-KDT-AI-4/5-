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
	List<BoardVO> ilist = (List<BoardVO>) request.getAttribute("ilist");
	int maxnum = (int) request.getAttribute("maxnum");
	%>
	<div>
	<thead>
		<table border="1">
			<tr>
				<td rowspan="4"><img src="img/<%=bvo.getP_img()%>" style="max-width: 700px;"></td>
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
				
				<a href='javascript:void(0);' onclick="cartdelete();" style="float: left;">
				찜빼기</a>
				<a href='javascript:void(0);' onclick="cartsave();" style="float: right;">
				찜하기</a>
				
				</td>
			</tr>
			<tr>
				<td align=left>
					<%
					if (bvo.getNum() > 1) {
					%> <a
					href="ViewService?pt_id=<%=bvo.getPt_id()%>&num=<%=bvo.getNum() - 1%>"
					style="float: left;">이전</a> <%
 					} else { %>이전 <% } %>
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