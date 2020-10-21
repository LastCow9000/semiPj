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
<script type="text/javascript">
$(document).ready(function(){
	$("#selectBox").submit(function () {
		//alert("gdgd");
		search();
		return false;
	});	
});

function search() {
      var agename = "${requestScope.ageName}"
      var option = $("#searchText option:selected").val();
      var word = $('#searchFormText').val().trim();
      
      // 검색 빈칸일 때 전송 X
      if(word==="") {
          alert("검색할 단어를 입력하세요");
          return false;
       }
      
      //전체 검색
	   if(${requestScope.ageName==null}) { 
		   location.href="${pageContext.request.contextPath}/front?command=searchall&option="+option+"&word="+word;
	   // 테마별 검색 
	   } else {
	      location.href="${pageContext.request.contextPath}/front?command=ageSearch&agename="+agename+"&option="+option+"&word="+word;   
	   }
}
</script>

</head>

<%-- header 상단 메뉴바 --%>
<c:import url="/template/header.jsp"></c:import>

<body bgcolor="red">

<%-- 검색기능 메인화면에서는 감추고 테마별 게시판은 등장 --%>
<div class="sch col-sm-6 col-sm-offset-6">
<form class="form-inline" id="selectBox" >
   <select style="width:80px; height:30px;" id="searchText">
      <option value="b.title">제목</option>
      <option value="m.nickname">작성자</option>
   </select>
    <input type="text" class="form-control" size="20" id="searchFormText">
    <button type="submit" class="btn btn-danger" >Search</button>
  </form>
</div>

<%-- 메인화면 --%>
<div class="container">    
  <div class="row">
    <div class="col-sm-10">
         <c:import url="${url}"></c:import>
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