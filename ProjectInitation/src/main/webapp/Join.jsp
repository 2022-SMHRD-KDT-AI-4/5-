<%@page import="xe.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h1>환영합니다^^</h1>
	<fieldset>
		<legend>'*' 표시 항목은 필수 입력 항목입니다.</legend>
		<form action="JoinService" method="post">
			<table>
				<tr>
					<td>ID :</td>
					<td><input type="text" id="u_id" name="m_id" placeholder="아이디를 입력하세요">*
						<button type="button" id="check_btn" onclick="check_id()">중복 확인</button>
					</td>
				</tr>
				<tr><p>필독!! ※아이디가 중복을 확인해 주세요※</p></tr>
				<tr>
					<td>PW :</td>
					<td><input type="password" id="i_pw1" name="n_pw1" placeholder="비밀번호을 입력하세요">*</td>
				</tr>

				<tr>
					<td>PW 확인 :</td>
					<td><input type="password" id="i_pw2" name="n_pw2" class="pw" placeholder="비밀번호를 확인하세요">*</td>
					<td><font id="checkPwFont"></font></td>
				</tr>

				<tr>
					<td>이름 :</td>
					<td><input type="text" name="m_name" placeholder="이름을 입력하세요">*</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<button type="button" id="JoinBtn" onclick="location.href='Login.jsp'">회원가입</button>
						<button type="button" name="cancel" onclick="location.href='Main.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</fieldset>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$('#JoinBtn').attr("disabled", true);
	
	function check_id() {
		let m_id = $('input[name=m_id]').val();
		console.log("Check : " + m_id);

		$.ajax({
			url : 'idCheck',
			type : 'post',
			data : {
				"m_id" : m_id
			},
			success : function(res) {
				if (res == 'true') {
					alert("사용 가능한 아이디입니다.");
					$('#JoinBtn').attr("disabled", false);
				} else {
					alert("중복된 아이디입니다.");
					$('#JoinBtn').attr("disabled", true);
				}
			},
			error : function() {
				alert("Error");
			}
		});
	}
	
	$(".pw").focusout(function(){
		var m_pw1 = $('#i_pw1').val();
		var m_pw2 = $('#i_pw2').val();
		
		if(m_pw1 != "" || m_pw2 != ""){
			if(m_pw1 == m_pw2){
				$('#JoinBtn').attr("disabled", false);
				$("#checkPwFont").html("비밀번호 일치").css("color", "green");
				alert("비밀번호가 일치 합니다.");
			}else{
				$('#JoinBtn').attr("disabled", true);
				$("#checkPwFont").html("비밀번호 불일치").css("color", "red");
				alert("비밀번호가 불일치 합니다.");
			}
		};
	});
	</script>

</body>
</html>