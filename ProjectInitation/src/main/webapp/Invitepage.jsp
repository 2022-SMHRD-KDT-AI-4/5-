<%@page import="xe.smhrd.model.BoardDAO"%>
<%@page import="xe.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/css/invitepage.css?ver=1.1">
    <link rel="stylesheet" type="text/css" href="assets/css/popup.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/icon.png" />
    <title>Come On Yo</title>
    <style>
        table, tr, td {
            padding: 0px;
            margin: 0px;
            background-color: rgba(255, 250, 240, 0.7);
        }
    </style>
</head>
<body id="write-info">
<div class="write-page" align="center">
    <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
</div>

<form name="form" action="InviteService" method="post">
    <h1 align="center">초대장 작성하기</h1>
<%
	List<BoardVO> cartList = (List<BoardVO>) session.getAttribute("cartList");
	BoardDAO dao = new BoardDAO();
	if(cartList == null){
%>
	<span id="null_list">찜 목록이 비었습니다.</span>
<%
	}else{
		for(BoardVO bvo : cartList){%>
			<!-- <div id="wrap" style="float:left; margin-left: 240px" width:auto;"> -->
			<div id="wrap" style="float:left; margin-left: 150px">
				<table id="wr-ta" width="650px" height="600px">
					 <tr height="50px" width="50px">
                        <th id="th1"><%=bvo.getP_name() %></th>
                        <th>대표이미지 설정
                            <input type="radio" name="p_id" value="<%=bvo.getP_id()%>">
                        </th>
                    </tr>
                    
                    <tr align="center">
                		<td id="content" rowspan="2">
                		<img src="img/<%=bvo.getP_img()%>" alt="<%=bvo.getP_name() %>" width="450px" height="500px"></td>
           		 	</tr>
           		 	
           		 	<tr height="100%">
                    	<td id="list" align="center">
                    	<%
                    		List<BoardVO> ilist = dao.selectPartyItemList(bvo.getP_id());
                    		for(BoardVO ivo : ilist){ // 해당 파티에 아이템 항목들을 불러오는 for문
                    	%>
                        	<li align="left"><%=ivo.getI_name()%></li><br>
                        <%} // 두번째 for문 닫히는 지점%>	
                    	</td>    
            		</tr>


<%			
		} //첫번째 for문 닫히는 지점
%>
				</table>
<%
	} // else 문 끝나는 지점
%>
			</div>
		
		
            
    <div style=" float:left; width:auto">       
          <table width="600px" height="600px">             
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">파티이름 : </td>
                  <td><input id="name" type="text" name="name"></td>
              </tr>
  
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">파티일자 : </td>
                  <td><input id="date" type="date" name="date"></td>
              </tr>
  
              <tr height="35px" bgcolor="whitesmoke">
                  <td align="right">장소 : </td>
                  <td><input id="addr" type="text" name="address"></td>
                 
              </tr>
              
              <tr bgcolor="gray" height="35px">
              	<th colspan="2" align="center">보내고 싶은 내용▼</th>
              <tr height="35px" bgcolor="whitesmoke">
                <td align="right" colspan="2" >
              		<textarea id="content" name="content" cols="85" rows="28">
			   	★☆당신을 초대합니다☆★
                        
			▶▷적고 싶은 내용을 적으세요◁◀
                    </textarea>
                </td>
              </tr>
              
             	       
              <tr height="35px" bgcolor="whitesmoke">
              	<td colspan="2" align="center">
              		<input type="submit" value="작성하기" onclick="presubmit();" style="background-color: #FFC99A; border: #FFC99A;">
					<!-- <button type="button" onclick="presubmit();" style="background-color: #FFC99A; border: #FFC99A;">작성하기</button> -->
                    <input type="reset" value="초기화" style="background-color: #FFC99A; border: #FFC99A;">
                </td>
              </tr>
          </table>
    </div>
 </form>

<a href="#pop_win" class="btn_open" style="display: none;" >팝업창 열기</a><br>
<div id="pop_win" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">누락된 항목이 있는지 확인해주세요</p>
			<button class="btn_close">확인</button>
		</div>
	</div>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function presubmit(){
var radio = $('input:radio[name="p_id"]').is(":checked");
var name = isNull($('input[name="name"]').val());
var date = isNull($('input[name="date"]').val());
var address = isNull($('input[name="address"]').val());
console.log(radio, name, date, address);
if(radio & name & date & address){
	console.log("동작확인");
	$('form[name="form"]').submit();
}else{
	console.log("작동봉쇄")
	popup();
	}	
}


var target = document.querySelectorAll('.btn_open');
var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
var targetID;

function popup(){
	console.log("팝업확인")
	document.querySelector("#pop_win").style.display = 'block';
}

//팝업 닫기
for (var j = 0; j < target.length; j++) {
	btnPopClose[j].addEventListener('click', function() {
		this.parentNode.parentNode.style.display = 'none';
	});
}

function isNull(obj) {
	return (typeof obj != "undefined" && obj != null && obj != "") ? true : false;
}

</script>

</body>
</html>