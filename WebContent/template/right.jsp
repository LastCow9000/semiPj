<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="point" value="${sessionScope.memberVO.point}"/>
<c:set var="rank" value="${sessionScope.memberVO.rank}"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css"/>

   <!--  로그인 오른쪽에 고정되는 화면 -->
   <c:choose>
   <c:when test="${sessionScope.memberVO==null }">
   <form action="${path}/front" method="POST">
   <p>
      <input type="hidden" name="command" value="login">
      <input type="text" name="id" placeholder="ID" required="required"> 
      <input type="password" name="Password" placeholder="Password" required="required"> 
      <input type="submit" value="로그인">
   </p>   
   </form>
   <p>
      <a href="${path}/front?command=registerForm">회원가입</a>
   </p>   
   <p>
      <a href="${path}/front?command=findpasswordform">비밀번호 찾기</a>
   </p>
   
   </c:when>
   <c:otherwise>
   <p align="center">
      ${sessionScope.memberVO.ageName } <br>
      
      <c:choose>
         <c:when test="${rank=='iron'}">
            <img class="rank" src="${path}/image/iron.png">
         </c:when>
         <c:when test="${rank=='bronze'}">
            <img class="rank" src="${path}/image/bronze.png">
         </c:when>
         <c:when test="${rank=='silver'}">
            <img class="rank" src="${path}/image/silver.png">
         </c:when>
         <c:when test="${rank=='gold'}">
            <img class="rank" src="${path}/image/gold.png">
         </c:when>
         <c:when test="${rank=='platinum'}">
            <img class="rank" src="${path}/image/platinum.png">
         </c:when>
         <c:when test="${rank=='diamond'}">
            <img class="rank" src="${path}/image/diamond.png">
         </c:when>
         <c:when test="${rank=='challenger'}">
            <img class="rank" src="${path}/image/challenger.png">
         </c:when>
      </c:choose>
      
      ${sessionScope.memberVO.nickName }님 <br>
      로그인 중
   </p>
   <div class="container">
   <p>
      <a href="${path}/front?command=logout">로그아웃</a>
   </p>
   
   <p>
      <a href="${path}/front?command=getdetailmember">내 정보</a>
   </p>
   
   
   <p>
      <a href="${path}/front?command=myScrapList">마이 스크랩</a>
   </p>
   <%-- 등급 progress bar --%>
   <c:choose>
   <c:when test="${rank=='iron'}">
        <div class="progress" id="iron">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="100" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
   <c:when test="${rank=='bronze'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="bronze">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="200" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
   <c:when test="${rank=='silver'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="silver">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="400" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
   </c:when>
   <c:when test="${rank=='gold'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="gold">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="700" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
   <c:when test="${rank=='platinum'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="platinum">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="1200" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
   <c:when test="${rank=='diamond'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="diamond">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="2000" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
   <c:when test="${rank=='challenger'}">
      <c:set var="percent" value="(${point}/100 * 100)"/>
        <div class="progress" id="challenger">
          <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="${point}" aria-valuemin="0" aria-valuemax="5000" style="width:${sessionScope.percent}%">
               ${sessionScope.percent}%
          </div>
         </div>
      </c:when>
    </c:choose>
       
    </div>
   </c:otherwise>
   </c:choose>
   <br>
   <!-- 랭킹 기능구현 -->
   <!-- 시대별 게시판에 들어가게 되면 HomeComtroller에서 받아온 rankList가 null이 된다. -->
   <c:choose>
   
   <c:when test="${requestScope.rankList==null }">
       <c:if test="${requestScope.ageName =='조선시대'}">
         <img class="age" src="${path}/image/조선시대.jpg"> 
       </c:if>
      <c:if test="${requestScope.ageName =='고조선시대'}">
         <img class="age" src="${path}/image/고조선시대.jpg"> 
       </c:if>
       <c:if test="${requestScope.ageName =='고려시대'}">
         <img class="age" src="${path}/image/고려시대.jpg"> 
       </c:if>
       <c:if test="${requestScope.ageName =='삼국시대'}">
         <img class="age" src="${path}/image/삼국시대.jpg"> 
       </c:if>
   </c:when>
   <c:otherwise>
      <!-- HomeController에서 받아온 rankList로 랭킹 포인트많은 순으로 정렬.  -->
      <div class="container">
      <div class="row">
      <div class="col-sm-3">
         <div class="panel panel-primary">
            <div class="panel-heading">핳랭킹 </div>
         <table class="table hoh">
            <thead>
               <tr>
                  <th>닉네임</th>
                  <th>포인트</th>
               </tr>
               <c:forEach items="${requestScope.rankList}" var="list"
                  varStatus="status" begin="0" end="4" step="1">
                  <tr>
                      <th><span class="badge badge-danger-light">${status.index+1 }</span>${list.nickName}</th>
                     <th>${list.point}</th>
                  </tr>
               </c:forEach>
            </thead>
         </table></div>
      </div></div></div>
   </c:otherwise>
   
   </c:choose>