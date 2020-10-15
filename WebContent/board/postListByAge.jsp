<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
	<div class="container">    
  <div class="row">
    <div class="col-sm-10">
      <div class="panel panel-primary">
        <div class="panel-heading">${requestScope.ageName} 게시물~!</div>
           <table class="table hoh">
           <thead>
              <tr>
                 <th>번호</th>
                 <th>제목</th>
                 <th>작성자</th>
                 <th>좋아요</th>
                 <th>조회수</th>
                 <th>게시일</th>
              </tr>
           </thead>
           <tbody>
<c:forEach var="list" items="${requestScope.list}">
           		<tr>
           			<td>${list.rnum}</td>
           			<td>${list.title}</td>
           			<td>${list.memberVO.nickName}</td>
           			<td>${list.likeCount}</td>
           			<td>${list.viewCount}</td>
           			<td>${list.regDate}</td>
           			           			
           		</tr>      
           		</c:forEach>
           </tbody>
           </table>
      </div>
    </div>
  </div>
</div>
	

</div>
</body>
</html>