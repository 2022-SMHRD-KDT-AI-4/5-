<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	'*' 표시 항목은 필수 입력 항목입니다.
	<form action="JoinService" method="post">
		<table>
			<tr>
				<td>ID : </td>		
				<td>
					<input type="text" name="m_id" placeholder="ID를 입력하세요">*
					<button type="button" id="check_btn" onclick="Check()">중복 확인</button>
				</td>		
				
			</tr>
			
			<tr>
				<td>PW : </td>
				<td><input type="password" name="m_pw" placeholder="PW을 입력하세요">*</td>
			</tr>
			
			<tr>
				<td>이름 : </td>
				<td><input type="text" name="m_name" placeholder="이름을 입력하세요">*</td>
			</tr>		
			
			<tr>
				<td colspan="2" align="center">
					<input id="JoinBtn" type="submit" value="회원가입">
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
						alert("사용 가능한 아이디입니다.");
						$('#JoinBtn').removeAttr('disalbed');
					}else{
						alert("중복된 아이디입니다.");
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