<%@page import="xe.smhrd.model.InviteVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 팝업기능에 필요한 최소한의 css -->

<style type="text/css">
.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 20px 30px;
	background: #fff;
	width: 400px;
	vertical-align: middle;
	font-size: 15px;
}
</style>

</head>
<body>
<%
	InviteVO myvo = (InviteVO) session.getAttribute("myvo");
	List<InviteVO> myitemlist = (List<InviteVO>) session.getAttribute("myitemlist");
	%>
<%-- 	
<form action="VoteService?v_id=<%=myvo.getV_id()%>" method="post"> --%>
<form action="VoteService?v_id=<%=myvo.getV_id()%>" method="post">
<div>
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border="1">
	<tr>
	<td>
	대표이미지
	</td>
	<td>
	파티에서 쓰고 싶은 아이템을 선택해주세요
	</td>
	</tr>
	<tr>
	<td>
	<img src="img/<%=myvo.getP_img() %>" style="max-width: 700px;">
	</td>
	<td>
		<%for(InviteVO ivo : myitemlist){
			%>
			<li><%=ivo.getI_name() %>
			<input type="checkbox" name="seli_id" value="<%=ivo.getI_id()%>"></li><br>
			<%	}%>
	</td>
	</tr>
	</table>
	
</div>
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr() %><br>
<br>
<!-- <input type="submit" value="아이템 추천투표하기"> -->
 </form>
<button OnClick="array_chk()">투표하기</button>
<a href="#pop_win" class="btn_open" style="display: none;" >팝업창 열기</a><br>


<!-- 팝업창 -->
	<div id="pop_win" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">투표가 완료되었습니다</p>

			<button class="btn_close">닫기</button>
		</div>
	</div>
<!-- 팝업창 끝 -->  

 
 
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">

	console.log("테스트14");
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;
	
    
    function array_chk() {
    	var v_id = <%=myvo.getV_id()%>;
        var para = [];
        $("input[name='seli_id']:checked").each(
        		function(i) {
        			para.push($(this).val());
        			}
        		); 
        var postData = { "v_id": v_id, "seli_id": para };
        
        $.ajax({
               url:'VoteService',
               type:'post',
               data:postData,
               traditional: true,
               error:function(){
                     alert('작성실패');
               },
               success:function(obj){
            	   popup();
               }
        });
    }   
 	
	// 팝업 닫기
	for (var j = 0; j < target.length; j++) {
		btnPopClose[j].addEventListener('click', function() {
			this.parentNode.parentNode.style.display = 'none';
		});
	}
    
 	// 팝업 열기
/* 	if(popup==Boolean(true)){
		console.log("팝업확인1")
		console.log(popup);
		document.querySelector("#pop_win").style.display = 'block';
		popup = Boolean(false);
		console.log(popup);
	} */
	function popup(){
 		console.log("팝업확인1")
 		document.querySelector("#pop_win").style.display = 'block';
 	}    
</script>
 
</body>
</html>