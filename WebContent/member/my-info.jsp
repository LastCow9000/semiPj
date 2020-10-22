<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript">
   $(document).ready(function() {
      $("#th_checkAll").click(function() {
         if ($("#th_checkAll").prop("checked")) {
            $("input[type=checkbox]").prop("checked", true);
         } else {
            $("input[type=checkbox]").prop("checked", false);
         }
      });//click

      $("#delete").click(function() {
         if(($("input[name=checkRow]:checked").length)==0){
            alert("삭제할 닉네임을 선택해 주세요!");
            return false;
         }
         else{
         $("input[name=checkRow]:checked").each(function() {
            var nickname = $(this).val();
            $.ajax({
               type : "get",
               url : "front",
               data : "command=follwerDel&nickname=" + nickname,
               success : function(result) {
                  if(result=="ok"){
                     //alert("팔로잉 삭제 성공!")
                      location.href = "${pageContext.request.contextPath}/front?command=getdetailmember";
                  }//if
               }
            });
         });//each
         }
      });//click
   });//ready
</script>


<div class="container">
   <div class="row">
      <div class="col-sm-offset-3 col-sm-4">
         <c:set var="following" value="${requestScope.followingList.size()}"></c:set>
         <table class="table hoh">
            <tr align="center">
               <td><strong><font color="#14274e">아이디</font></strong></td>
               <td>${sessionScope.memberVO.id}</td>
            </tr>
            <tr align="center">
               <td><strong><font color="#14274e">닉네임</font></strong></td>
               <td>${sessionScope.memberVO.nickName}</td>
            </tr>
            <tr align="center">
               <td><strong><font color="#14274e">시대</font></strong></td>
               <td>${sessionScope.memberVO.ageName}</td>
            </tr>

            <tr align="center">
               <td rowspan=${following+2}><strong><font color="#14274e">팔로잉</font></strong>
               <input type="checkbox" name="checkAll" id="th_checkAll"></td>

               <c:forEach items="${requestScope.followingList}" var="list">
                  <tr>
                     <td>
                     <input type="checkbox" name="checkRow" id="check" value="${list}" /> ${list}</td>
                  </tr>
               </c:forEach>
               
               <tr>
                  <td colspan="" align="right">
                     <input type="submit" id="delete" value="팔로잉 삭제" class="btn btn-danger btn-xs">
                  </td>
               </tr>
      
            <tr>
               <td colspan="2" align="right">
               <input type="button" value="회원정보 수정하기" class="btn-info" 
                  onclick="location.href='${pageContext.request.contextPath}/front?command=updatememberForm'">
               </td>
            </tr>
            
            <tr>
               <td colspan="2" align="right">
               <input type="button" value="회원탈퇴" class="btn-warning" 
                  onclick="location.href='${pageContext.request.contextPath}/front?command=deletememberform'">
               </td>
            </tr>
            
         </table>
      </div>
   </div>
</div>