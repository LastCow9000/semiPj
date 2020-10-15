<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 
<%-- 핳게시물 --%>
<div class="container">    
  <div class="row">
	<div class="col-sm-5">
      <div class="panel panel-primary">
        <div class="panel-heading">고조선 시대 Hot 게시물~!</div>
        	<form id="gojosun">
           <table class="table hoh">
           <thead>
              <tr>
                 <td>순위</td>
                 <td colspan='1'>제목</td>
                 <td colspan='20'>작성자  ${requestScope.hohlist}</td>
              </tr>
           </thead>
           <tbody>
          
          <c:if test="${requestScope.hohlist[3].memberVO.ageName=='고조선시대'}">
           <c:forEach items="${requestScope.hohlist}" var="list" varStatus="status">
           	
                 <tr>
                    <td>${status.count}</td>
                    <td width=300px>${list.title}</td><%-- 23자리까지 --%>
                    <td>${list.memberVO.nickName}</td>
                 </tr>
                 </c:forEach>
                </c:if>
                 </tbody>
           </table>
           </form>
      </div>
    </div>
    <div class="col-sm-5"> 
      <div class="panel panel-danger">
        <div class="panel-heading">삼국 시대 Hot 게시물~!</div>
        <form id="threeKingdom">
        <table class="table hoh">
           <thead>
              <tr>
                 <td>순위</td>
                 <td colspan='1'>제목</td>
                 <td colspan='20'>작성자</td>
              </tr>
           </thead>
           <tbody>
                 <tr>
                    <td>1</td>
                    <td width=300px>안녕하세요이ㅓㄱ나ㅣㅓ</td><%-- 23자리까지 --%>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>2</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>3</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>4</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>5</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 </tbody>
           </table>
           </form>
      </div>
    </div>

  </div>
</div><br>

<!-- 홈화면에서 아래에 있는 두개의 핫게시물 공간 -->
<div class="container">    
  <div class="row">
    <div class="col-sm-5">
      <div class="panel panel-primary">
        <div class="panel-heading">고려 시대 Hot 게시물~!</div>
        <div class="panel-body">
        <form id="goryeo">
        <table class="table hoh">
           <thead>
              <tr>
                 <td>순위</td>
                 <td colspan='1'>제목</td>
                 <td colspan='20'>작성자</td>
              </tr>
           </thead>
           <tbody>
                 <tr>
                    <td>1</td>
                    <td width=300px>안녕하세요이ㅓㄱ나ㅣㅓ</td><%-- 23자리까지 --%>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>2</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>3</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>4</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>5</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 </tbody>
           </table>
           </form>
        </div>
      </div>
    </div>
    <div class="col-sm-5"> 
      <div class="panel panel-primary">
        <div class="panel-heading">조선 시대 Hot 게시물~!</div>
        <div class="panel-body">
        <form id="josun-list.jsp">
        <table class="table hoh">
           <thead>
              <tr>
                 <td>순위</td>
                 <td colspan='1'>제목</td>
                 <td colspan='20'>작성자</td>
              </tr>
           </thead>
           <tbody>
                 <tr>
                    <td>1</td>
                    <td width=300px>안녕하세요이ㅓㄱ나ㅣㅓ</td><%-- 23자리까지 --%>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>2</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>3</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>4</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>5</td>
                    <td>안녕하세요</td>
                    <td>이동욱</td>
                 </tr>
                 </tbody>
           </table>
           </form>
           </div>
        <!-- <div class="panel-footer">현재 가장 좋아요수가 가장 높은 게시물들 입니다</div>  -->		
      </div>
    </div>
     
  </div>
</div><br><br>
