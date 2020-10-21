<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#th_checkAll").click(function() {
			if ($("#th_checkAll").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});//click

		$("#delete").click(function() {
			if(($("input[name=checkRow]:checked").length)==0){
				alert("삭제할 닉네임을 선택해 주세요!");
				return false;
			}
			else{
			$("input[name=checkRow]:checked").each(function() {
				var nickname = $(this).val();
				$.ajax({
					type : "get",
					url : "front",
					data : "command=follwerDel&nickname=" + nickname,
					success : function(result) {
						if(result=="ok"){
							//alert("팔로잉 삭제 성공!")
							 location.href = "${pageContext.request.contextPath}/front?command=getdetailmember";
						}//if
					}
				});
			});//each
			}
		});//click
	});//ready
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<c:set var="following" value="${requestScope.followingList.size()}"></c:set>
				<table class="table hoh">
					<tr align="center">
						<td>아이디</td>
						<td colspan=${following}>${sessionScope.memberVO.id}</td>
					</tr>
					<tr align="center">
						<td>닉네임</td>
						<td colspan=${following}>${sessionScope.memberVO.nickName}</td>
					</tr>
					<tr align="center">
						<td>시대</td>
						<td colspan=${following}>${sessionScope.memberVO.ageName}</td>
					</tr>

					<tr align="center">
						<td rowspan=${following+1}>팔로잉<input type="checkbox"
							name="checkAll" id="th_checkAll"></td>

						<c:forEach items="${requestScope.followingList }" var="list">
							<tr>
								<td colspan=${following}><input type="checkbox"
									name="checkRow" id="check" value="${list}" />${list}</td>
							</tr>
						</c:forEach>
					</tr>
					<tr>
						<td colspan=${following+1 }><input type="submit" id="delete"
							value="삭제하기"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="button"
							value="회원정보 수정하기"
							onclick="location.href='${pageContext.request.contextPath}/front?command=updatememberForm'">
						</td>
						<td><input type="button" value="회원탈퇴"
							onclick="location.href='${pageContext.request.contextPath}/front?command=deletememberform'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>