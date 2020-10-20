<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<%-- bootstrap 에서 가져온 링크들  --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var repNo=opener.document.getElementById("btn_del").value;
	alert(repNo);
	
	var repPassword=opener.document.getElementById("repPassword");
	function closePopup(){
		self.close();
	}
	$(document).ready(function() {
		$("#delete").click(function(){
			if(confirm("정말 삭제하시겠습니까?")){
				if(repPassword.value==$("#password").val()){
							$.ajax({
								type:"get",
								url:"${pageContext.request.contextPath}/front",
								data:"command=replydelete&repNo="+repNo,
								success: function(result){
									if(result=="ok"){
										closePopup();
									}
								}
							});
						}else{
							alert("비밀번호를 다시 확인해주세요");
						}
					}		
		});//click
	});//ready
</script>
</head>
<body onunload="closePopup()">
<%--<form action="${pageContext.request.contextPath}/front" method="post" id="replydeleteForm"> --%>
<input type="hidden" id="repNo" name="repNo" value="0">
<input type="hidden" name="command" value="replydelete">
<br><p>삭제하시려면 비밀번호를 입력하세요</p>
<input type="password" id="password" class="form-control" required="required"><br>
<input type="button" id="delete" value="확인" class="btn btn-danger">
<%--</form> --%>
</body>
</html>

