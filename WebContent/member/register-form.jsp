<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

	// 시대 체크박스 하나만 선택하게 강제하는 함수
	function oneCheckbox(age) {
		var checkboxDoc = document.getElementsByName("checkbox1");
		for (var i=0; i<checkboxDoc.length; i++){
			if(checkboxDoc[i] != age){
				checkboxDoc[i].checked = false;
			}
		}
	}
	
	//(시대)체크박스 null일 때 submit이 안되도록 강제하는 함수
	function validateCheckboxes() {
	   if (document.querySelector('.check:checked')) {
	        return true;
	   } else {
	        alert('시대를 선택해주세요!');
	        return false;
	   }
	};
		
	$(document).ready(function() {
		
		var checkId="";
		var checkNick="";

		/* 길이 체크 공간 */
		
		// 1. 아이디 길이 체크
		$("#memberId").keyup(function() {
			checkId="";
			var idValue= $(this).val().trim();
			// 아이디 길이 체크
			if(idValue.length<4||idValue.length>10){
				$("#idCheckResult").html("아이디는 4~10자 이내로 작성해주세요").css("color","violet");
				return;
			}
			// 아이디 중복 체크
			$.ajax({
				type : "get",
				url : "front",
				data : "command=idCheckResult&id="+idValue,
				success : function(result) {
					// 아이디가 사용가능하면 = 중복이 아니면
					if (result == "ok"){
						$("#idCheckResult").html("사용가능한 아이디입니다.").css(
								"color", "blue");
						checkId = idValue; 
					} else { // 아이디가 사용불가하면 = 중복이면
						$("#idCheckResult").html("중복된 아이디입니다.").css(
								"color", "red");
					}
				}
			});
		});//keyup
		
		
		
		// 2. 닉네임 길이 체크
		 $("#memberNick").keyup(function() {
			 
			checkNick="";
			var nickValue= $(this).val().trim();

			// 닉네임 길이 체크
			if(nickValue.length<2||nickValue.length>7){
				$("#nickCheckResult").html("닉네임은 2~7자 이내로 작성해주세요").css("color","violet");
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
						//alert($(this).text());
					} else { // 닉네임 사용불가하면 = 중복이면
						$("#nickCheckResult").html("중복된 닉네임입니다.").css(
								"color", "red");
					}
				}
			});
		});//keyup
		
		
		
		/* 중복 확인 공간 */
		
		// 아이디 중복확인해서 사용가능 상태일때만 가입되도록 한다.
		$("#registerForm").submit(function() {
			if(checkId==""){
				alert("아이디를 확인해주세요!");
				return false;
			}
		});
		
		// 닉네임 중복확인해서 사용가능 상태일때만 가입되도록 한다.
		 $("#registerForm").submit(function() {
			if(checkNick==""){
				alert("닉네임을 확인해주세요!");
				return false;
			}
		});
		
		
	
		// 비밀번호 길이 체크
		$("#passwordC").keyup(function() {
			var passValue=$(this).val();
			//$("#passwordResult").html($(this).val());
			if(passValue.length<4||passValue.length>12){
				$("#passwordResult").html("비밀번호는 4~12자 이내로 작성해주세요").css("color","violet");
				return;
			} else {
				$("#passwordResult").html("적합한 비밀번호입니다.").css("color","blue");
			}
		});
		
		
		$("#passwordChecked").keyup(function() {
			var passValue =$("#passwordC").val();
			var passChecked = $(this).val();
			if(passChecked===passValue){
				$("#passwordCheckResult").html("비밀번호가 일치합니다.").css("color","blue");
			}else{
				$("#passwordCheckResult").html("비밀번호가 불일치합니다.").css("color","red");
			}
		});
	});//ready
	
</script>
</head>
<body>
<div class="container">
	<div class="row">
	    <div class="col-sm-6">
	    
<form action="${pageContext.request.contextPath}/front" method="Post" id="registerForm"
		onsubmit="return validateCheckboxes()">
		
	<input type="hidden" name="command" value="register">
	
	<table class="table hoh">
	
		<tr align="center">
			<td>아이디</td>
			<td><input type="text" name="id" id="memberId" required="required"></td>
			<td><span id="idCheckResult"></span></td>
		</tr>
		
		<tr align="center">
			<td>패스워드</td>
			<td><input type="password" name="password" id="passwordC" required="required"></td>
			<td><span id="passwordResult"></span></td>
		</tr>
		
		<tr align="center">
			<td>패스워드 확인</td>
			<td><input type="password" name="password" id="passwordChecked" required="required"></td>
			<td><span id="passwordCheckResult"></span></td>
		</tr>

		<tr align="center">
			<td>닉네임</td>
			<td><input type="text" name="nickname" id="memberNick" required="required"></td>
			<td><span id="nickCheckResult"></span></td>
		</tr>
	
		<tr align="center">
			<td>시대</td>
			<td colspan="2" align="left">
				<input type="checkbox" name="checkbox1" class="check" value="고조선시대" onclick="oneCheckbox(this)">고조선시대
				<input type="checkbox" name="checkbox1" class="check"  value="삼국시대" onclick="oneCheckbox(this)">삼국시대
				<input type="checkbox" name="checkbox1" class="check"  value="고려시대" onclick="oneCheckbox(this)">고려시대
				<input type="checkbox" name="checkbox1" class="check"  value="조선시대" onclick="oneCheckbox(this)">조선시대<br>
			</td>
			<td><span id="nickCheckResult"></span></td>
		</tr>
		
		<tr>
			<td colspan="3" align="center"><input type="submit" class="btn-warning" value="회원가입"></td>
		</tr>
	</table>
	
</form>

		</div>
	</div>
</div>
</body>
</html>