<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<%-- 수정버튼과 삭제버튼이 한줄로나오게끔 ! --%>
<style type="text/css">
 form{display:inline}
</style>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
<script>

   if(${requestScope.likeCheck==1}) {
      $(document).ready(function() { 
         $("#heartBlank").hide();
         $("#heart").html("<i class='fa fa-heart' style='color:red'></i>")
      });
   }
      
   $(document).ready(function() {
   
   
    $("#likeBtn").click(function(){
       if(${sessionScope.memberVO==null}) {
          alert("로그인 후 사용할 수 있습니다.");
          return;
       }
       $.ajax({
          type:"get",
          url:"front",
          data:"command=likeCount&loginId=${sessionScope.memberVO.id}&postNo=${requestScope.postVO.postNo}&postId=${requestScope.postVO.memberVO.id}",
          success: function(result){ 
             if(result==="좋아요한 게시물") {
                if(confirm("이미 좋아요를 누른 게시물입니다.\n 좋아요를 취소하시겠습니까?")) {
                      $.ajax({
                         type:"get",
                         url:"front",
                         data:"command=likeCancel&loginId=${sessionScope.memberVO.id}&postNo=${requestScope.postVO.postNo}&postId=${requestScope.postVO.memberVO.id}",
                         success: function(result){
                            $("#heartBlank").show();
                            $("#heart").hide();
                         }
                      }); // ajax
                } 
                $("#heart").html("<i class='fa fa-heart' style='color:red'></i>");
             }
             $("#heartBlank").hide();
             $("#heart").show().html("<i class='fa fa-heart' style='color:red'></i>");            
          }
       }); // ajax
    }); // click
   }); //ready
</script>

</head>
<body>
   <div class="container">
         <div class="row">
            <div class="col-sm-10">
               <div class="panel panel-primary">
             		<div class="panel-heading">공지사항</div>
                  <table class="table hoh">
                     <%-- 버튼 부분: 본인의 아이디와 일치할 경우 '수정' '삭제' 버튼 보임 --%>
                     <c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id  || sessionScope.memberVO.id == 'adminmts'}">
                        <tr align="right">
                           <td colspan="3" class="btnArea postbtn">
                              <form name="deleteForm" action="${pageContext.request.contextPath}/front" method="post">
                                 <input type="hidden" name="command" value="deleteNoticePost">
                                 <input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
                                 <input type="hidden" name="nickName" value="${requestScope.postVO.memberVO.nickName }"> 
                                 <input type="submit" class="btn btn-warning" value="삭제">
                              </form> &nbsp;
                              <c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id}">
                               <form name="updateForm" action="${pageContext.request.contextPath}/front" method="post">
                                 <input type="hidden" name="command" value="updateNoticeform">
                                 <input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
                                 <input type="hidden" name="rnum" value="${requestScope.rnum}"> 
                                 <input type="submit" class="btn btn-info" value="수정">
                              </form>
                              </c:if>
                           </td>
                        </tr>
                     </c:if>
                   
               <tr>
                  <td colspan="2"><strong>${requestScope.postVO.title}</strong></td>
                  <td colspan="1" align="right"><span class="glyphicon glyphicon-time"></span> 작성일 : ${requestScope.postVO.regDate }</td>
               </tr>
                  
               <tr>
                  <td colspan="1" align="left">작성자 <strong>${requestScope.postVO.memberVO.nickName}</strong></td>
                  <td colspan="2" align="right">
                  <span class="glyphicon glyphicon-user"></span>
                  <strong>${requestScope.postVO.viewCount}</strong>
                  </td>
               </tr>
               
                     <tr>
                  <td colspan="3"><pre> ${requestScope.postVO.content}</pre></td>
               </tr>

                  
                  </table>

               </div>
            </div>
         </div>
      </div>
   </body>
</html>