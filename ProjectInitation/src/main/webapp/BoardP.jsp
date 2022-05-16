<%@page import="xe.smhrd.model.MemberVO"%>
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
    <title>Come On Yo</title>
    <link rel="stylesheet" type="text/css" href="assets/css/BoardP.css?ver=1.1">
    <link rel="stylesheet" type="text/css" href="assets/css/sideheart.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png" />
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

<body id="board">
<%MemberVO vo = (MemberVO) session.getAttribute("vo");%>
<div class="board_header">
	<a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
</div>

	
	
    <div class="wrap">
        <h1 id="headname"></h1>
        <div class="fixed_img_col">
            <ul id="listset">
            </ul>
        </div>
    </div>
    
<!-- 찜목록 영역 -->
<button class="cartopen" style="position: fixed; right:22px; top: 11px; margin: 0; padding: 0;  display: block;">
    <img src="img/bono.png"  onclick="cartopen()" width="40px" height="40px" alt="보노보노">
    </button>
    
    <div class="outer-div" style="margin-right: -40%;">			
    <%List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");%>
		<div class="title">
        <h3>찜 목록</h3>
        <button class="cartclose" style="position: absolute; right:2px;top: 2px; margin: 0; padding: 0; ">
        <img src="img/bono.png"  onclick="cartclose()" width="40px" height="40px" alt="보노보노">
        </button>
        </div>
    	<div class="inner-div">
    	<table border="0">
    	<tbody id="cart">
    	</tbody>
		</table>
		</div>
		<div class="button">
		<input id="btn_clear" type="button" onclick="cartclear();" value="비우기">
        <input id="btn_write" type="button" id="toInvite" onclick = "location.href = 'Invitepage.jsp'" value="작성하기">
		</div>
    </div>
    <!-- 찜목록 영역 끝 -->

    
    <!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	let pv_pt_id = getParameterByName("pt_id");

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
		boardload(pv_pt_id);
		makecartlist(); 
	})
	
	
	/* 리스트 생성 구문 */
	
	function boardload(pv_pt_id, pv_num){
		$.ajax({
			url : 'ListService',
			type : 'post',
			dataType : "json",
			data : {
				"pt_id" : pv_pt_id,
			},
			 success : function(board){
	               console.log("통신성공(보드호출)");
 	               makeheadname(board);
	               makeboard(board);
	               console.log(board[0].pt_name);
	            },
	            error : function(){ alert('error!'); }
	         });
	}
	
	function makeheadname(board){
 		console.log("헤드 작성 시작");
 		$('#headname').html('');
 		h1 = board[0].pt_name+` 한 눈에 보기`;
 		$('#headname').append(h1);
 	}
	
	
	function makeboard(board){
 		console.log("보드 작성 시작");
 		$('#listset').html('');
 		for(let i = 1; i<board.length; i++){
 		tr = `
  			<li>
    		<a href="BoardView.jsp?pt_id=`+board[i].pt_id+`&num=`+board[i].num+`">
        		<span class="thumb">
            		<div class="img"><img class="cover" src="img/`+board[i].p_img+`" alt="`+board[i].p_name+`"/></div>
            		<em style="font-size: 45px;">클릭하여 자세히 보기</em>
        		</span>
        		<strong>`+board[i].p_name+`</strong>
    		</a>
		</li> 
			`;
 		$('#listset').append(tr);
 		}
 	}
	
	/* 리스트 생성 세트 끝 */
	
	
	
	
	/* 카트 생성 구문 */

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
	
	/* 카트 생성 세트 끝 */
	
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
 	
	
	
	/* 파라미터 수집 함수 */
	
	function getParameterByName(name) {
	    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	        result = regex.exec(location.search);
	    return result === null ? "" : decodeURIComponent(result[1].replace(/\+/g, " "));
	}
	
	</script>
</body>
</html>