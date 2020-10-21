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
   
</head>
<body>
   <div class="container">
         <div class="row">
            <div class="col-sm-10">
               <div class="panel panel-primary">
     				<div class="panel-heading">${requestScope.postVO.memberVO.ageName}</div>
               
                  <form action="${pageContext.request.contextPath}/front" method="post">
                  <table class="table hoh">

                     <tr>
                        <td colspan="2">제목&nbsp;&nbsp;<input type="text" name="title" value=" ${requestScope.postVO.title}" size="60"></td>
						<td colspan="1" align="right"><span class="glyphicon glyphicon-time"></span> 작성일 : ${requestScope.postVO.regDate }</td>
                     </tr>

                     <tr>
						<td colspan="1" align="left">작성자 <strong>${requestScope.postVO.memberVO.nickName}</strong></td>
						<td colspan="2" align="right">
						<span class="glyphicon glyphicon-user"></span>
						<strong>${requestScope.postVO.viewCount}</strong>  | 
						<span class="glyphicon glyphicon-thumbs-up"></span>
						<strong>${requestScope.postVO.likeCount }</strong>
						</td>
                     </tr>

                     <tr>
                        <td colspan="3">
                           <textarea rows="5" cols="115" name="content">${requestScope.postVO.content}</textarea>
                        </td>
                     </tr>
                     
                     <tr align="center">
                     <td colspan="3" class="btnArea">
                        <input type="hidden" name="command" value="updatepost">
                        <input type="hidden" name="postNo" value="${requestScope.postVO.postNo}">
                        <button type="submit" class="btn btn-info">수정 완료</button>
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