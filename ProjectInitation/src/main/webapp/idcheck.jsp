<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<script type="text/javascript">
	function idCheck() {
		if (document.join.m_id.value == "") {
			alert('���̵� �Է��Ͽ� �ֽʽÿ�.');
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
	<h2>���̵� �ߺ� Ȯ��</h2>
	<form action="idCheck" method="get" name="join">
		���̵� <input type="text" name="m_id" values="${m_id}"> <input
			type="submit" values="�ߺ� üũ"> <br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.join.m_id.value = "";
			</script>
			${m_id}�� �̹� ��� ���� ���̵��Դϴ�.
		</c:if>
		<c:if test="${result == -1}">
			${m_id}�� ��� ������ ���̵��Դϴ�.
			<input type="button" value="���" class="cancel" onclick="idok()">
		</c:if>
	</form>
</body>
</html>