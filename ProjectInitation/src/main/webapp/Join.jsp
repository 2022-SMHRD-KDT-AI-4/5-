<%@page import="xe.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width initial scale 1.0">
    <meta name="p:domain_verify" content="5106e0d8c90f98f5675e3292a49d07b5"/>
     <title>Join</title>
     <link rel="stylesheet" type="text/css" href="assets/css/main.css">
     <link rel="stylesheet" type="text/css" href="assets/css/main_m.css" media="only screen and (max-width:910px)">
     <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
     <script src="assets/base.js"></script>
</head>
<body>
	
    <div class="join-sys" >
        <a href="Main.jsp"><img src="assets/images/logoda.png" alt=""></a>
    </div>

	<div class="join-page">
		<div class="forms">
			<form class="register-form">

				<input type="text" name="m_name" placeholder="name :ex) choi wooshik"/>
				<input type="text" id="u_id" name="m_id" placeholder="id :ex) eddy"/>
				<button type="button" id="check_btn" onclick="check_id()">double check</button>
				<input type="password" id="i_pw1" name="n_pw1" placeholder="pw :ex) summer"/>
				<input type="password" id="i_pw2" name="n_pw2" class="pw" placeholder="retype pw :ex) summer"/> 
				<input type="submit" id="JoinBtn" value="create">
				<input type="button" id="cancel" value="cancel" onclick="location.href='Main.jsp'">
				<p class="messages">Already registered? <a href="Login.jsp">Sign In</a></p>
		
			</form>
		</div>
	</div> 
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