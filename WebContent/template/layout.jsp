<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOH 메인화면</title>
<%-- bootstrap 에서 가져온 링크들  --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%-- css 경로 설정 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css"/>

</head>

<%-- header 상단 메뉴바 --%>
<c:import url="/template/header.jsp"></c:import>

<body>

<%-- 검색기능 메인화면에서는 감추고 테마별 게시판은 등장 --%>
<div class="sch col-sm-6 col-sm-offset-6">
<form class="form-inline">
	<select style="width:80px; height:30px;">
		<option value="">---</option>
		<option value="제목">제목</option>
		<option value="작성자">작성자</option>
	</select>
    <input type="email" class="form-control" size="20">
    <button type="button" class="btn btn-danger">Search</button>
  </form>
</div>

<%-- 메인화면 --%>
<div class="container">    
  <div class="row">
    <div class="col-sm-10">
			<c:import url="/template/home.jsp"></c:import>
  </div>
  
<div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
    	<%-- 로그인 사이드 --%>
			<c:import url="/template/right.jsp"></c:import>
    </div>
   </div>
</div>
 </div>
   </div>

<c:import url="/template/footer.jsp"></c:import>
</body>
</html>



























