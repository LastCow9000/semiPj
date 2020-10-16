<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">

	// 해결하지 못한 문제...
	// 1. 본인이 다시 본인의 닉네임으로 변경했을 때조차
	//    '중복된 닉네임 입니다'라고 뜬다 ㅠㅠ
		
	$(document).ready(function() {
		
		var checkNick="";
		//$("#nickChecked").val()="";
		/* 길이 체크 공간 */
		
		// 2. 닉네임 길이 체크
		 $("#nickChecked").keyup(function() {
			checkNick="";
			var nickValue= $(this).val();
			// 닉네임 길이 체크
			if(nickValue.length<4||nickValue.length>8){
				$("#nickCheckResult").html("닉네임은 4~8자 이내로 작성해주세요").css("color","violet");
			return;
			}
			// 닉네임 중복 체크
			$.ajax({
				type : "get",
				url : "front",
				data : "command=nickCheckedResult&nickname="+nickValue,
				success : function(result) {
					// 닉네임이 사용가능하면 = 중복이 아니면
					if (result == "ok"){
						$("#nickCheckResult").html("사용가능한 닉네임입니다.").css(
								"color", "blue");
						checkNick = nickValue; 
					} else { // 닉네임 사용불가하면 = 중복이면
						$("#nickCheckResult").html("중복된 닉네임입니다.").css(
								"color", "red");
					}
				}
			});
		});//keyup
		
		
		
		/* 중복 확인 공간 */
		
		// 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
		 $("#registerForm").submit(function() {
			if(checkNick==""){
				alert("닉네임 중복확인하세요!");
				return false;
			}
		});
		
		
		// 비밀번호 길이 체크
		$("#passwordC").keyup(function() {
			var passValue=$(this).val();
			if(passValue.length<4||passValue.length>12){
				$("#passwordResult").html("4~12자 이내로 작성해주세요").css(
						"color","violet");
				return;
			} else {
				$("#passwordResult").html("적합한 비밀번호입니다.").css(
						"color","blue");
			}
		});
		
		
	});//ready
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <div class="row">
	    <div class="col-sm-6">
	
	<form action="front" method="post" id="registerForm">
	<input type="hidden" name="command" value="updatemember">
	<input type="hidden" name="point" value="${sessionScope.memberVO.point}">
	
	<table class="table hoh">
	
		<tr align="center">
			<td>아이디</td>
			<td><input type="text" name="id" value="${sessionScope.memberVO.id}" readonly="readonly"></td>
			<td>아이디는 변경 불가능합니다.</td>
		</tr>
		
		<tr align="center">
			<td>시대</td>
			<td><input type="text" name="ageName" value="${sessionScope.memberVO.ageName}" readonly="readonly"></td>
			<td>시대는 변경 불가능합니다.</td>
		</tr>
		
		
		<tr align="center">
			<td>닉네임</td>
			<td><input type="text" name="nickname" id="nickChecked" value="${sessionScope.memberVO.nickName}" required="required"></td>
			<td><span id="nickCheckResult"></span></td>
			
		</tr>
		<tr align="center">
			<td>패스워드</td>
			<td><input type="password" name="password" id="passwordC" value="${sessionScope.memberVO.password}" required="required"></td>
			<td><span id="passwordResult"></span></td>
		</tr>

		<tr>
			<td colspan="3" align="center">
				<input type="submit" value="회원정보 수정 완료">
			</td>
		</tr>
		
	</table>
	</form>
	
	
</div>
</div>
</div>

