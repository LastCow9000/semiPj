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
	
<script>
	function scrap(){
		if(confirm("게시글을 삭제하시겠습니까?")){
			document.removeForm.submit();
		} else {
			return;
		}
	}
	
	function like() {
		if(confirm("게시글을 수정하시겠습니까??")){
			document.updateForm.submit();
		} else {
			return;
		}
	}
	 
	$(document).ready(function() {
		$("#followAdd").click(function() {
			 if(${sessionScope.memberVO==null}) {
		            alert("로그인한 사용자만 팔로우 가능!");
		            return;
		         }
			 
				if(confirm("팔로우하시겠습니까?")){
			 $.ajax({
					type:"get",
					url:"front",
					data:"command=follwerCheck&nickname=${requestScope.postVO.memberVO.nickName}&id=${sessionScope.memberVO.id}",				
					success:function(result){
						if(result!="ok"){
								alert("이미 팔로우했습니다!");}
						else
							{
							$.ajax({
								type:"get",
								url:"front",
								data:"command=follwerAdd&nickname=${requestScope.postVO.memberVO.nickName}&id=${sessionScope.memberVO.id}",				
								success:function(result){
									alert("팔로우 추가완료!");
									
								}
							})
							
							}
					}
				})
			//alert(${requestScope.postVO.memberVO.nickName});
			 }
		})
	})
</script>

</head>
<body>
	<div class="container">
			<div class="row">
				<div class="col-sm-9">
					<div class="panel panel-primary">
						<table class="table hoh">
							<%-- 버튼 부분: 본인의 아이디와 일치할 경우 '수정' '삭제' 버튼 보임 --%>

							<c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id}">
								<tr align="right">
									<td colspan="3" class="btnArea">
										<form name="deleteForm" action="${pageContext.request.contextPath}/front" method="post">
											<input type="hidden" name="command" value="deletepost">
											<input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
											<input  type="submit" class="btn" value="삭제">
										</form>
										<form name="updateForm" action="${pageContext.request.contextPath}/front" method="post">
											<input type="hidden" name="command" value="updateform">
											<input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
											<input type="hidden" name="rnum" value="${requestScope.rnum}"> 
											<input type="submit" class="btn" value="수정">
										</form>
									</td>
								</tr>
							</c:if>


							<tr align="left">
								<td colspan="3">글번호 ${requestScope.rnum}</td>
							</tr>

							<tr>
								<td colspan="1">제목 ${requestScope.postVO.title}</td>
								<td colspan="1" align="right">작성일 ${requestScope.postVO.regDate }</td>
							</tr>

							<tr>
								<td colspan="1" align="left">작성자 ${requestScope.postVO.memberVO.nickName }</td>
								<td colspan="1" align="right">조회수 ${requestScope.postVO.viewCount }</td>
								<td colspan="1" align="right">좋아요수 ${requestScope.postVO.likeCount }</td>

							</tr>

							<tr>
								<td colspan="3">본문 내용</td>
							</tr>

							<tr>
								<td colspan="3"><pre> ${requestScope.postVO.content}</pre></td>
							</tr>

							<%-- 좋아요 / 스크랩 버튼 부분 --%>
							<tr align="center">
							
								<td colspan="3" class="btnArea">
									<form name="deleteForm" action="${pageContext.request.contextPath}/front" method="post">
										<input type="hidden" name="command" value="조하조하요~">
										 <input type="hidden" name="no" value="${requestScope.postVO.postNo}">
									</form>
		
									<form name="updateForm" action="${pageContext.request.contextPath}/front" method="post">
										<input type="hidden" name="command" value="스크랩해버릴테얌!">
										<input type="hidden" name="no" value="${requestScope.postVO.postNo}">
									</form>
									<button type="button" class="btn btn-default btn-sm" onclick="scrap()"><span class="glyphicon glyphicon-bookmark"></span> 스크랩 </button>
									<button type="button" class="btn btn-default btn-sm" onclick="like()"> <span class="glyphicon glyphicon-thumbs-up"></span>좋아요</button>
									
									<button type="button" class="btn btn-default btn-sm" id="followAdd" ><span class="glyphicon glyphicon-plus"></span> 팔로우 </button>
								</td>
							</tr>

							<tr>
								<td colspan="3">댓글 폼 부분</td>
							</tr>

						</table>

					</div>
				</div>
			</div>
		</div>
	</body>
</html>