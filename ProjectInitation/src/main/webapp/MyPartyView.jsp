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
<%-- 	<form action="MyResultService?v_id=<%=myvo.getV_id()%>" method="post"> --%>
<form id="frm" action="MyCommitService?v_id=<%=myvo.getV_id()%>&action=commit" method="post">
<div>
	<h1><%=myvo.getV_name() %></h1><br>
	<%=myvo.getV_cont() %><br><br>
	<table border="1">
	<tr>
	<td>
	대표이미지
	</td>
	<td>
	사용될 아이템 목록
	</td>
	<td>
	추천수
	</td>
	<td>
	최종 선택
	</td>
	</tr>
	<tr>
	<td rowspan="<%=myitemlist.size()%>">
	<img src="img/<%=myvo.getP_img() %>" style="max-width: 700px;">
	</td>
		<%for(InviteVO ivo : myitemlist){ %>
		<td>
			<li><%=ivo.getI_name() %></li>
			</td><td>
			<%=ivo.getSel_g() %>
			</td><td>
			<input type="checkbox" name="seli_id" value="<%=ivo.getI_id()%>">
			</td><tr>
			<%	}%>
	</td>
	</tr>
	</tr>
	</table>
	
</div>
</form>
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr()%><br>
<br>


<!--   </form> -->

<a href="#pop_win1" class="btn_open">파티에 사용할 아이템 추천 링크 띄우기</a><br>
<a href="#pop_win2" class="btn_open">초대장 최종안 링크 보기</a><br>
<a href="#" onclick="chk_form()" >초대장 최종안 제출하기</a><br>
<a href="#pop_win3" class="btn_open" style="display: none;" >팝업창 열기</a><br>

<!-- 기본 url 따오는 창 (안보임) -->
<input type="text" id = "ShareUrl" style="display: none;">  
  <!-- 팝업창 -->
	<div id="pop_win1" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">초대장을 복사해주세요</p>
			<input type="text" id = "ShareUrl1" style="width:400px"><br>
			<button OnClick="javascript:CopyUrlToClipboard1()" class="btn_close">URL 복사</button>
		</div>
	</div>


	<div id="pop_win2" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">초대장을 복사해주세요</p>
			<input type="text"  id = "ShareUrl2"  style="width:400px"><br>
			<button OnClick="javascript:CopyUrlToClipboard2()" class="btn_close">URL 복사</button>
		</div>
	</div>
	
	<div id="pop_win3" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="resultdsc">정상적으로 등록되었습니다</p>
			<!-- 
			<p class="dsc">초대장을 복사해주세요</p>
			<input type="text"  id = "ShareUrl3"  style="width:400px"><br>
			<button OnClick="javascript:CopyUrlToClipboard3()" class="btn_close">URL 복사</button>
			 -->
			<button class="btn_close">창닫기</button>
		</div>
	</div>
	<!-- 팝업창 끝 -->  

  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;
	
	var obShareUrl = document.getElementById("ShareUrl");	
	var obShareUrl1 = document.getElementById("ShareUrl1");
	var obShareUrl2 = document.getElementById("ShareUrl2");

	
	obShareUrl.value = window.document.location.host	//현재 주소 추출
	// 최종목적지 설정
	obShareUrl1.value = obShareUrl.value+"/ProjectInitation/MyVoteService?v_id=<%=myvo.getV_id()%>";
	obShareUrl2.value = obShareUrl.value+"/ProjectInitation/MyResultService?v_id=<%=myvo.getV_id()%>";

	
	$('#ShareUrl').val(obShareUrl.value);
	$('#ShareUrl1').val(obShareUrl1.value);
	$('#ShareUrl2').val(obShareUrl2.value);
	

	
	function CopyUrlToClipboard1(){	
		obShareUrl1.select();  // 해당 값이 선택되도록 select() 합니다
		document.execCommand("copy"); // 클립보드에 복사합니다.
		obShareUrl1.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
		alert("URL이 클립보드에 복사되었습니다"); 
	}
	function CopyUrlToClipboard2(){	
		obShareUrl2.select();
		document.execCommand("copy");
		obShareUrl2.blur();
		alert("URL이 클립보드에 복사되었습니다"); 
	}
/* 	
 	var obShareUrl3 = document.getElementById("ShareUrl3"); 
 	obShareUrl3.value = obShareUrl2.value 
 	$('#ShareUrl3').val(obShareUrl3.value); 
 	function CopyUrlToClipboard3(){	
		obShareUrl3.select();
		document.execCommand("copy");
		obShareUrl3.blur();
		alert("URL이 클립보드에 복사되었습니다"); 
	} 
	 */
	function chk_form() {
		document.getElementById('frm').submit();
	}
	
	var popup = new Boolean(false);
	if(<%=session.getAttribute("popup")%>!=null){
		popup = new Boolean(<%=session.getAttribute("popup")%>);
	}

	if(popup==Boolean(true)){
		console.log("팝업확인")
		document.querySelector("#pop_win3").style.display = 'block';
		popup = new Boolean(false);
		<%request.getSession().setAttribute("popup", false);%>
	}

 	// 팝업 열기
	for (var i = 0; i < target.length; i++) {
		target[i].addEventListener('click', function() {
			targetID = this.getAttribute('href');
			document.querySelector(targetID).style.display = 'block';
		});
	}
 	
	// 팝업 닫기
	for (var j = 0; j < target.length; j++) {
		btnPopClose[j].addEventListener('click', function() {
			this.parentNode.parentNode.style.display = 'none';
		});
	}
	

  </script>

</body>
</html>