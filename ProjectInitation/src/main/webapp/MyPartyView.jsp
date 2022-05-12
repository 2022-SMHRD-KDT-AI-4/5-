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
	width: 200px;
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
	<form action="MyResultService?v_id=<%=myvo.getV_id()%>" method="post">
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
개최일시 : <%=myvo.getV_date()%><br>
개최지 : <%=myvo.getV_adr()%><br>
<br>

<input type="submit" value="초대장 최종안 결정한기">
 <input type="reset" value="선택 초기화">
  </form>
  
  <!-- 팝업창 -->
<a href="#pop_win" class="btn_open">파티에 사용할 아이템 추천 링크 띄우기</a><br>
	<div id="pop_win" class="pop_wrap" style="display: none;">
		<div class="pop_inner">
			<p class="dsc">초대장을 복사해주세요</p>
			<input type="text" id = "ShareUrl"><br>
			<button OnClick="javascript:CopyUrlToClipboard()" class="btn_close">URL 복사</button>
		</div>
	</div>
<!-- 팝업창 끝 -->  
  	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;
	var obShareUrl = document.getElementById("ShareUrl");
	
	obShareUrl.value = window.document.location.href	//현재 주소 추출
	obShareUrl.value = obShareUrl.value.replace("#pop_win","");  // 팝업태그 제거
	obShareUrl.value = obShareUrl.value.replace("?v_id=<%=myvo.getV_id()%>","");	// 현 주소 파라메터값 제거
	obShareUrl.value = obShareUrl.value.replace(window.document.location.pathname,"");	//호스트만 남기고 모두 삭제
	obShareUrl.value += "/ProjectInitation/MyVoteService?v_id=<%=myvo.getV_id()%>";	// 최종 목표 링크 추가
	$('#ShareUrl').val(obShareUrl.value);
	
 	
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
 	 
	function CopyUrlToClipboard(){	
		obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
		document.execCommand("copy"); // 클립보드에 복사합니다.
		obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
		alert("URL이 클립보드에 복사되었습니다"); 
	}

  </script>

</body>
</html>