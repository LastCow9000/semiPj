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
<c:forEach var="listvo" items="${requestScope.listvo}">
           		<tr>
           			<td>${listvo.rnum}</td>
           			<td><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${listvo.postNo}&rnum=${list.rnum}">${list.title}</a></td>
           			<td>${listvo.memberVO.nickName}</td>
           			<td>${listvo.likeCount}</td>
           			<td>${listvo.viewCount}</td>
           			<td>${listvo.regDate}</td>
           			           			
           		</tr>      
           		</c:forEach>
           </tbody>
           </table>
           <c:set var="pb" value="${requestScope.listvo.pagingBean }"> </c:set>
           <div class="pagingArea">
           <ui>
           </div>
           
           
           
      </div>
    </div>
  </div>
</div>
	

</div>
</body>
</html>