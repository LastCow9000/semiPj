<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">

/* 길이 체크 공간 */

$(document).ready(function() {
   
   var checkTitle="";

   // 제목 길이 체크
   $("#writeTitle").keyup(function() {
      checkTitle = "";
      var titleValue= $(this).val().trim();
      //제목 길이 20자 넘어가면 빨갛게
      if(titleValue.length > 20){
         $("#titleCheckResult").html(titleValue.length).css("color","red");
         return;
      //제목 길이 평소에는 grey로
      } else {
         $("#titleCheckResult").html(titleValue.length).css("color","grey");
         checkTitle = titleValue;
      }
   });//keyup
    
   /* 길이 넘었을 때 submit 안 되도록 막기 */
   $("#writePostForm").submit(function() {
      if(checkTitle == ""){
         alert("제목 길이는 20자 이내로 작성해주세요.");
         return false;
      }
   });//sumit
   
});//ready

</script>

<div class="container">
   <div class="row">
      <div class="col-sm-10">
         <div class="panel panel-primary">
         
         <!-- header 부분 -->
         <c:choose>
            <c:when test="${sessionScope.memberVO.id=='adminmts'}">
               <div class="panel-heading">공지사항 작성하기</div>
            </c:when>
            <c:otherwise>
               <div class="panel-heading">${sessionScope.memberVO.ageName} 게시글 작성하기</div>
            </c:otherwise>
         </c:choose>
         
         
         <form action="${pageContext.request.contextPath}/front" id="writePostForm"
            method="post" onsubmit="return validateWritePost()">
            <input type="hidden" name="command" value="writepost">
            <table class="table hoh">

                   <tr>
                      <td colspan="3">제목 : <input id="writeTitle" type="text" name="title" placeholder="제목을 입력하세요">
                      &nbsp;<span id="titleCheckResult"></span>/20</td>
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