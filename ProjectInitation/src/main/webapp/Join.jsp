<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>ȸ������</h1>
	'*' ǥ�� �׸��� �ʼ� �Է� �׸��Դϴ�.
	<form action="JoinService" method="post">
		<table>
			<tr>
				<td>ID : </td>		
				<td>
					<input type="text" name="m_id" placeholder="ID�� �Է��ϼ���">*
					<button type="button" id="check_btn" onclick="Check()">�ߺ� Ȯ��</button>
				</td>		
				
			</tr>
			
			<tr>
				<td>PW : </td>
				<td><input type="password" name="m_pw" placeholder="PW�� �Է��ϼ���">*</td>
			</tr>
			
			<tr>
				<td>�̸� : </td>
				<td><input type="text" name="m_name" placeholder="�̸��� �Է��ϼ���">*</td>
			</tr>		
			
			<tr>
				<td colspan="2" align="center">
					<input id="JoinBtn" type="submit" value="ȸ������">
				</td>			
			</tr>
		</table>
	</form>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		function Check() {
			let m_id = $('input[name=m_id]').val();
			console.log("Check : " + m_id);
			
			$.ajax({
				url : 'idCheck',
				type : 'post',
				data : {
					"m_id" : m_id
				},
				success : function(res){
					if(res == 'true'){
						alert("��� ������ ���̵��Դϴ�.");
						$('#JoinBtn').removeAttr('disalbed');
					}else{
						alert("�ߺ��� ���̵��Դϴ�.");
						$('#JoinBtn').attr("disabled", "disabled");
					}
0				},
				error : function(){
					alert("Error");
				}
			});
		}
	</script>
	
</body>
</html>