<%@page import="xe.smhrd.model.MemberVO"%>
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
    <title>Come On Yo</title>
    <link rel="stylesheet" type="text/css" href="assets/css/BoardView.css?ver=3">
    <link rel="stylesheet" type="text/css" href="assets/css/sideheart.css">
    <link rel="stylesheet" type="text/css" href="assets/css/input.css">
</head>
<body id="heart-info">
<%
	MemberVO mvo = (MemberVO) session.getAttribute("vo");
%>
	<nav class="privacy">
	<%if (mvo == null) {%>
		<div class="icons">
			<a class="login-icon" href="Login.jsp">login</a>
			<a class="join-icon" href="Join.jsp">join</a>
		</div>
	<%} else {%>
		<div class="icons">
			<a class="logout-icon" href="LogoutService">logout</a>
		</div>
	<%}%>
	</nav>
	
	<div class="board_header" align="center">
		<a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
	</div>
	
	<div class="wrap">
    	<table border-collapse:collapse; width="1200px">
			<thead id="board">
			</thead>
    	</table>
	</div>
	
	
<!-- 찜목록 영역 -->
<button class="cartopen" style="position: fixed; right:22px; top: 11px; margin: 0; padding: 0;  display: block;">
    <img src="img/bono.png" width="40px" height="40px" alt="보노보노">
</button>
    
    <div class="outer-div" style="margin-right: -40%;">			
    <%List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");%>
		<div class="title">
        <h3>찜 목록</h3>
        <button class="cartclose" style="position: absolute; right:2px;top: 2px; margin: 0; padding: 0; ">
        	<img src="img/bono.png"  width="40px" height="40px" alt="보노보노">
        </button>
        </div>
    	<div class="inner-div">
    	<table border="0">
    	<tbody id="cart">
    	</tbody>
		</table>
		</div>
		<div class="button" display="flex">
			<input type="button" onclick="cartclear();" value="비우기">
        	<input type="button" id="toInvite" onclick = "location.href = 'Invitepage.jsp'" value="작성하기">
		</div>
    </div>
    <!-- 찜목록 영역 끝 -->
		

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	let pv_p_id;
	let pv_pt_id = getParameterByName("pt_id");
	let pv_num = getParameterByName("num");
	
	let p_id = [];
	let p_name = [];
	let p_img = [];
	<% if (cartList != null) {
		for (BoardVO cvo : cartList) {	%>
		p_id.push('<%=cvo.getP_id()%>');
		p_name.push('<%=cvo.getP_name()%>');
		p_img.push('<%=cvo.getP_img()%>');
		<% } }%>
	
	
	$(document).ready(function() {
		console.log("시작");
		boardload(pv_pt_id, pv_num);
		makecartlist();
	})
	
	function boardload(pv_pt_id, pv_num){
		$.ajax({
			url : 'ViewService',
			type : 'post',
			dataType : "json",
			data : {
				"pt_id" : pv_pt_id,
				"num" : pv_num,				
			},
			 success : function(board){
	               console.log("통신성공(보드호출)");
	               pv_p_id = board.p_id;
	               pv_pt_id = board.pt_id;
	               pv_num = board.num;
	               makeboard(board);
	               itemload(board);
 	               
	            },
	            error : function(){ alert('error!'); }
	         });
	}
	
	function cartclear(){
		$.ajax({
			url : 'CartClearService',
			type : 'post',
			success : function(cart){
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
				"p_id" : pv_p_id,
				"pt_id" : pv_pt_id,
				"num" : pv_num,
				"action" : "save",
			},
			 success : function(cart){
	               console.log("통신성공(세이브)");
	               clearcartlist();
	               setcartlist(cart);
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
				"p_id" : pv_p_id,
				"pt_id" : pv_pt_id,
				"num" : pv_num,
				"action" : "delete",
			},
			 success : function(cart){
	               console.log("통신성공(딜리트)");
	               clearcartlist();
	               setcartlist(cart);
	               makecartlist();
	            },
	            error : function(){ alert('error!'); }
	         });
	}
	
	function setcartlist(cart){
		console.log("카트 리스트 채움");
		for (var i = 0; i < cart.length; i++){
			p_id.push(cart[i].p_id);
			p_name.push(cart[i].p_name);
			p_img.push(cart[i].p_img);
	 	  }
		}
		
		function clearcartlist(){
			console.log("카트 리스트 비우고 새로 작성");
			p_id = [];
			p_name = [];
			p_img = [];
			$('#cart').html('');	//리스트 일괄삭제
		}
		
		function makecartlist(){	
			console.log("카트 리스트 작성 시작");	
			for (var i = 0; i < p_id.length; i++){
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
	
 	function itemload(board){
		$.ajax({
			url : 'ItemlistService',
			type : 'post',
			dataType : "json",
			data : {
				"p_id" : board.p_id,		
			},
			 success : function(item){
	               console.log("통신성공(아이템로드)");
	               makeitem(item);
	            },
	            error : function(){ alert('error!'); }
	         });
	} 
 	
 	function makeboard(board){
 		console.log("보드 작성 시작");
 		$('#board').html(''); 
 		tr = `
 			<tr class="head">
 	           	<th id="th1">`+board.p_name+`</th>
 	           	<th id="th2">조회수 : `+board.p_view+`</th>
 	      	</tr>
 	      	<tr height="700px"> 
 	      		<td id="content" >
 	      			<div class="bg-contain" style="background-image:url(/ProjectInitation/img/`+board.p_img+`);" alt="`+board.p_name+`"></div>
           		</td>
       		<td id="list">
    		</td>
       		</tr>
   			<tr height="40px">
   			<td id="button1"align="center">
            </td>
            <td id="button2" align="center">
                <input type="button" class="intable" value="찜하기" onclick="cartsave();">
                <input type="button" class="intable" value="찜빼기 " onclick="cartdelete();">
            </td> 
      		</tr>
			`;
 		$('#board').append(tr);
 		if(board.num > 1){
 			td = `
 				<input type="button" value="Back" onClick="boardload('`+board.pt_id+`','`+(board.num-1)+`')">
 			`
 			$('#button1').append(td);
 		}
 		if(board.num < board.maxnum){
 			td = `
 				<input type="button" value="Next" onClick="boardload('`+board.pt_id+`','`+(board.num+1)+`')">
 			`
 			$('#button1').append(td);
 		}
 	}
 	
 	function makeitem(item){
 		console.log("아이템 리스트 작성 시작");
 		for(var i = 0; i < item.length; i++){
 			tr = `
 				<li>`+item[i].i_name+`</li><br>
			`;
 			$('#list').append(tr);
 		}
 	}
 	
 	
	/* 카트 열기 닫기 세트 */
	 
  	$('.cartopen').click(function(){
 		$(this).fadeOut();
 		$('.outer-div').animate({
 			marginRight:0
 		},1000);
 	});
 	
 	$('.cartclose').click(function(){
 		$('.cartopen').fadeIn();
 		$('.outer-div').animate({
 			marginRight:'-40%'
 		},1000);
 	});
 	
 	/* 카트 열기 닫기 세트 끝 */
 	
 	
	if(<%=session.getAttribute("vo")==null%>){
 		$('#toInvite').attr("disabled", true);
 	}else{
 		$('#toInvite').attr("disabled", false);
 	}
	
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        result = regex.exec(location.search);
	    return result === null ? "" : decodeURIComponent(result[1].replace(/\+/g, " "));
	}
</script>
</body>
</html>