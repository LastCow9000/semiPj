<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
<%-- bootstrap 에서 가져온 링크들  --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

    function updateRep(rNo, content){
       var htmls = "";
         htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
         htmls += content;
         htmls += '</textarea>';
         htmls += '<span class="d-block">';
         htmls += '<strong class="text-gray-dark"></strong>';
         htmls += '<span style="padding-left: 7px; font-size: 9pt">';
         htmls +='<div class="col-sm-2" align="left">'
         htmls +='<input type="password" id="password" placeholder="비밀번호를 입력하세요">';
         htmls +='</div>';
         htmls +='<div class="col-sm-8" align="right">';
         htmls += '<button class="btn btn-info save" id="save" value="'+ rNo +'" style="padding-right:5px">저장</button>';
         htmls += '<input type="button" class="btn btn-info" value="취소" onClick="document.location.reload()">';
         htmls +='</div>';
         htmls += '</span>';
         htmls += '</span>';      
         $('#repContent' + rNo).html(htmls);
      } 
    
         $(document).ready(function() {
            $(document).on("click",".save",function(){
	               $.ajax({
	                  type:"get",
	                  url:"${pageContext.request.contextPath}/front",
	                  data:"command=replyupdate&content="+ $("#editContent").val() +"&repNo="+ $(this).val() + "&password=" + $("#password").val(),
	                  success:function(result){
	                     if(result=="ok"){
	                        document.location.reload()
	                     }else{
	                    	 alert("비밀번호를 확인해주세요!");
	                     }
	                  }//success
	               });//ajax
            });//click
         });//ready
         
      //댓글삭제
      $(document).ready(function() {
         var options='width=450, height=200, top=185, left=250'; //팝업창 옵션
         $("#replyListForm").on("click", ".deleteBtn", function(){
            window.open("${pageContext.request.contextPath}/front?command=replydeletepopup&repNo="+$(this).val(), "delconfirmpopup", options);
         });
      });
         
   </script>
   </head>
   <body>
      <div class="container-fluid">
         <div class="row content">

            <div class="col-sm-9">
            <c:if test="${sessionScope.memberVO!=null}">
               <h3>
                  <small><strong><font color="#3d84a8">댓글</font></strong></small>
               </h3>
               <form name="replyForm" action="${pageContext.request.contextPath}/front" method="post">
                  <div class="form-group">
                     <input type="text" name="nick" placeholder="작성자명" required="required">
                     <input type="password" name="password" placeholder="비밀번호" required="required">
                     <textarea name="replyContent" id="replyContent" class="form-control" rows="3" required></textarea>
                  </div>
                  <input type="hidden" name="command" value="replywrite"> 
                  <input type="hidden" name="postNo" id="postNo" value="${requestScope.postVO.postNo}">
                  <button type="submit" class="btn btn-success btn-sm">작성</button>
               </form>
            </c:if>

            <hr class="devideHr">
            
               <p>
                  <span class="badge">${requestScope.replyCount}</span> 개의 댓글:
               </p>
               <br>
               <div id="replyListForm">
               
                  <c:forEach items="${requestScope.replyList}" var="repList">
                     <div class="row">
                     
                        <div class="col-sm-2 text-center">
                           <img src="${pageContext.request.contextPath}/image/dankun.jpg" class="img-rounded" height="50" width="50" alt="profileImage">               
                        </div>
                        
                        <div class="col-sm-10">
                           <strong>
                              ${repList.nick}
                           </strong>
                           
                           <input type="hidden" name="repNo" value="${repList.comNo}">
                           <p id="repContent${repList.comNo}">${repList.content}</p>
                           <c:if test="${sessionScope.memberVO!=null}">
                           <button class="btn btn-info btn-xs updateBtn" onclick="updateRep('${repList.comNo}','${repList.content}')">수정</button>
                           <button class="btn btn-danger btn-xs deleteBtn" value="${repList.comNo}">삭제</button>
                           </c:if>
                        </div>
                        
                     </div>
                     <hr class="reply">
                  </c:forEach>
               </div>
            </div>

         </div>
      </div>
   </body>
   </html>




