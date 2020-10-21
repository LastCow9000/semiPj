<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글작성 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<div class="panel panel-primary">
				<c:choose>
					<c:when test="${sessionScope.memberVO.id=='adminmts' }">
						<div class="panel-heading">공지사항 작성하기</div>
					</c:when>
					<c:otherwise>
						<div class="panel-heading">${sessionScope.memberVO.ageName} 게시글 작성하기</div>
					</c:otherwise>
				</c:choose>
					<form action="${pageContext.request.contextPath}/front" id="writePost"
						method="post">
						<input type="hidden" name="command" value="writepost">
						<table class="table hoh">

                     <tr>
                        <td colspan="3">제목 : <input type="text" name="title" placeholder="제목을 입력하세요"></td>
                     </tr>


                     <tr>
                        <td colspan="3">
						<textarea rows="10" cols="120" placeholder="본문 내용을 입력하세요"
							name="content"></textarea>                       
						 </td>
                     </tr>

                     <tr align="center">
                     <td>
                     <input type="submit" value="작성하기" class="btn btn-success">
                     </td>
                     </tr>
                  </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>