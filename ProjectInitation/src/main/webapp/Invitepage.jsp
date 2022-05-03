<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="board">
		<form action="InviteService" method="post">
			<table id="list">
				<tr>
					<td>파티이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>파티일자</td>
					<td><input type="date" name="date"></td>
				</tr>
				<tr>
					<td colspan="2">내용</td>
				</tr>
				<tr>
					<td colspan="2"> <textarea name="content" rows="10"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="reset" value="초기화"> <input
						type="submit" value="작성하기"></td>
				</tr>
			</table>
		</form>
	</div>


</body>
</html>