<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <div class="row">
	    <div class="col-sm-4">
	
	<table class="table hoh">
		<tr align="center">
			<td>아이디</td>
			<td>${sessionScope.memberVO.id}</td>
		</tr>
		<tr align="center">
			<td>닉네임</td>
			<td>${sessionScope.memberVO.nickName}</td>
		</tr>
		<tr align="center">
			<td>시대</td>
			<td>${sessionScope.memberVO.ageName}</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="회원정보 수정하기"
				onclick="location.href='${pageContext.request.contextPath}/front?command=updatememberForm'">
			</td>
		</tr>
	</table>
	
	
</div>
</div>
</div>

</body>
</html>