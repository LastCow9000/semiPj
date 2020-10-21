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
   function scrap(){
      if(confirm("게시글을 삭제하시겠습니까?")){
         document.removeForm.submit();
      } else {
         return;
      }
   }
   
   
   $(document).ready(function() {
   
   /* 스크랩 기능 */
      
      $("#scrap_btn").click(function() {
         //스크랩 대상 postNo
         var checkPostNo = ${requestScope.postVO.postNo};
         
         // 1) 비 로그인시, alert -> return 
         if(${sessionScope.memberVO == null}){
            alert("로그인 후 사용하세요.");
            return;
         }//if
         
         
         // 2) 로그인 시
         //alert(checkPostNo);
         //alert("${sessionScope.memberVO.id}");

         //기존 스크랩 여부 체크
         //alert(checkPostNo);
         $.ajax({
            type : "get",
            url : "front",
            data : "command=CheckscrapPost&postNo="+checkPostNo,
            success : function(result) {
               
               // 스크랩할 수 있으면 = 중복이 아니면
               if (result == "ok"){
                  
                  // 스크랩 하겠다고 하면
                  if(confirm("해당 게시물을 스크랩 하시겠습니까?")){
                     $.ajax({
                        type : "get",
                        url : "front",
                        data :"command=ScrapPost&postNo="+checkPostNo,
                        success: function(result){
                           if (result == "ok"){
                              if(confirm("스크랩이 완료되었습니다.\n마이스크랩으로 이동하시겠습니까?")){
                                 location.href = "${pageContext.request.contextPath}/front?command=myScrapList";
                              }else{
                                 return;
                              }
                           } else {
                              alert("스크랩 동작에서 오류가 발생했습니다.");
                           }
                        } //ajax2 success
                     
                     })//ajax 속 ajax
                     
                  } else { //스크랩 안하겠다고 하면
                     return;
                  }
                  
               // 스크랩할수 없으면= 중복이면
               } else { 
                  alert("이미 스크랩된 게시물입니다.");
               }
               
            }//ajax1 success
         
         });//ajax1
         
      });//sracp_btn
      
   
      $("#likeBtn").click(function(){
         if(${sessionScope.memberVO==null}) {
            alert("로그인한 사용자만 좋아요 가능!");
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
            <div class="col-sm-9">
               <div class="panel panel-primary">
                  <table class="table hoh">
                     <%-- 버튼 부분: 본인의 아이디와 일치할 경우 '수정' '삭제' 버튼 보임 --%>

                     <c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id  || sessionScope.memberVO.id == 'adminmts'}">
                        <tr align="right">
                           <td colspan="3" class="btnArea">
                              <form name="deleteForm" action="${pageContext.request.contextPath}/front" method="post">
                                 <input type="hidden" name="command" value="deleteNoticePost">
                                 <input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
                                 <input type="hidden" name="nickName" value="${requestScope.postVO.memberVO.nickName }"> 
                                 <input  type="submit" class="btn" value="삭제">
                              </form>
                              <c:if test="${requestScope.postVO.memberVO.id == sessionScope.memberVO.id}">
                               <form name="updateForm" action="${pageContext.request.contextPath}/front" method="post">
                                 <input type="hidden" name="command" value="updateNoticeform">
                                 <input type="hidden" name="no" value="${requestScope.postVO.postNo}"> 
                                 <input type="hidden" name="rnum" value="${requestScope.rnum}"> 
                                 <input type="submit" class="btn" value="수정">
                              </form>
                              </c:if>
                           </td>
                        </tr>
                     </c:if>


                   
                     <tr>
                        <td colspan="1">제목 ${requestScope.postVO.title}</td>
                        <td colspan="1" align="right"><span class="glyphicon glyphicon-time"></span>작성일 ${requestScope.postVO.regDate }</td>
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
                              <%-- 스크랩 기능
                           <form id="scrapForm" action="${pageContext.request.contextPath}/front" method="POST">
                              <input type="hidden" name="command" value="scrapPost">
                              <input type="hidden" name="postNo" value="${requestScope.postVO.postNo}">
                           </form>  --%>
                           
                           
                           
                           <%-- 스크랩 버튼 --%>
                           <button type="button" id="scrap_btn" class="btn btn-default btn-sm">
                              <span class="glyphicon glyphicon-bookmark"></span> 스크랩 
                           </button>
                           <%-- 좋아요 버튼 --%>
                           <button type="button" class="btn btn-default btn-sm" onclick="like()" id="likeBtn"> <span class="fa fa-heart-o" style="color:red" id="heartBlank"></span><span id="heart"></span>좋아요</button>
                           <span id="likeView"></span>
                           <button type="button" class="btn btn-default btn-sm" id="followAdd" ><span class="glyphicon glyphicon-plus"></span> 팔로우 </button>
                        </td>
                     </tr>
                  </table>

               </div>
            </div>
         </div>
      </div>
   </body>
</html>