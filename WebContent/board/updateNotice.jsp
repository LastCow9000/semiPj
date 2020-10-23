<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">

/* 길이 체크 공간 */

$(document).ready(function() {
	
	var titleValue=$("#writeTitle").val().trim();
		
	// 1. 제목 부분 클릭하면 기존 제목 길이 나옴
	$("#writeTitle").click(function() {
		var orgTitleVal = $(this).val().trim();
		//제목 길이 20자 넘어가면 빨갛게
		if(orgTitleVal.length > 20){
			$("#titleCheckResult").html(orgTitleVal.length).css("color","red");
		//제목 길이 평소에는 grey로
		} else {
			$("#titleCheckResult").html(orgTitleVal.length).css("color","black");
		}
	});//click
	
	
	// 2. 제목 길이 체크
	$("#writeTitle").keyup(function() {
		var submitTitle = $(this).val().trim();
		//제목 길이 20자 넘어가면 빨갛게
		if(titleValue.length > 20){
			$("#titleCheckResult").html(titleValue.length).css("color","red");
		//제목 길이 평소에는 grey로
		} else {
			$("#titleCheckResult").html(titleValue.length).css("color","grey");
		}
		titleValue = submitTitle;
	});//keyup
	 
	
	/* 길이 넘었을 때 submit 안 되도록 막기 */
	$("#updatePostForm").submit(function() {
		if(titleValue.length>20){
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
   				<div class="panel-heading">공지사항</div>
            
               <form action="${pageContext.request.contextPath}/front" method="post" 
               		id="updatePostForm" onsubmit="return validateWritePost()">
               
               <table class="table hoh">

                   <tr>
                     <td colspan="2">제목&nbsp;&nbsp;<input type="text" name="title" id="writeTitle" value=" ${requestScope.postVO.title}" size="60">
                     &nbsp;<span id="titleCheckResult"></span>/20</td>
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
                     <td colspan="3">
                        <textarea rows="5" cols="115" name="content">${requestScope.postVO.content}</textarea>
                     </td>
                  </tr>
                  
                  
                  <tr align="center">
	                  <td colspan="3" class="btnArea">
	                     <input type="hidden" name="command" value="updateNoticePost">
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
