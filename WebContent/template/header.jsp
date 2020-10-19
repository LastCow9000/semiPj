<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set value="${pageContext.request.contextPath}" var="path"/>
    

<!-- 
<div class="jumbotron">
  <div class="text-center">
    <a href=#><font size="10px">고조선 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
    <a href=#><font size="10px">삼국 시대 </font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">고려 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">조선 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</div>
 -->
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
<<<<<<< HEAD
    <div class="navbar-header">
      <a class="navbar-brand" href="${path}/front?command=home">HOH</a>
=======
	<div class="navbar-header">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/front?command=home">HOH</a>
>>>>>>> branch 'master' of https://github.com/LastCow9000/semiPj.git
    </div>
    <ul class="nav navbar-nav">
      <li><a href="${path}/front?command=agelist&agename=고조선시대">고조선</a></li>
      <li><a href="${path}/front?command=agelist&agename=삼국시대">삼국</a></li>
      <li><a href="${path}/front?command=agelist&agename=고려시대">고려</a></li>
      <li><a href="${path}/front?command=agelist&agename=조선시대">조선</a></li>
    </ul>
    </div>
</nav>