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
		<form action="WriteService" method="post"
			enctype="multipart/form-data">
			<table id="list">
				<tr>
					<td>파티분류코드</td>
					<td><input type="text" name="pt_id"></td>
				</tr>
				<tr>
					<td>파티코드</td>
					<td><input type="text" name="p_id"></td>
				</tr>
				<tr>
					<td>파티이름</td>
					<td><input type="text" name="p_name"></td>
				</tr>
				<tr>
					<td>파티설명</td>
					<td> <textarea name="p_cont" rows="10"></textarea>
					</td>
					
				</tr>
				<tr>
				<td colspan="2"><input type="file",	name="file"></td></tr>
				<tr>
					<td colspan="2"><input type="reset" value="초기화"> <input
						type="submit" value="작성하기"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>