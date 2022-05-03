<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 관리</title>
<script type="text/javascript">
	function idCheck() {
		if (document.join.m_id.value == "") {
			alert('아이디를 입력하여 주십시오.');
			document.join.m_id.focus();
			return;
		}
		var url = "idCheck?m_id=" + document.join.m_id.value;
		window
				.open(url, "_blank_",
						"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
	}

	function idok() {
		opener.join.m_id.value = document.join.m_id.value;
		opener.join.reid.value = document.join.m_id.value;
		self.close();
	}
</script>
</head>
<body>
	<h2>아이디 중복 확인</h2>
	<form action="idCheck" method="get" name="join">
		아이디 <input type="text" name="m_id" values="${m_id}"> <input
			type="submit" values="중복 체크"> <br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.join.m_id.value = "";
			</script>
			${m_id}는 이미 사용 중인 아이디입니다.
		</c:if>
		<c:if test="${result == -1}">
			${m_id}는 사용 가능한 아이디입니다.
			<input type="button" value="사용" class="cancel" onclick="idok()">
		</c:if>
	</form>
</body>
</html>