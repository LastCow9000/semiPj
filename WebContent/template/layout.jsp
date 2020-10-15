<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>모의 화면</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */ 
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */ 
     .jumbotron {
      margin-bottom: 25px;
      height: 150px;
    }
    .sch {
     margin-bottom: 25px;
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    .hoh {
      margin-top: 20px;
      text-align: center;
      border: 1px solid;
    }
    td {
    border: 1px solid;
    }
    .tt {
          text-align: left;
    }
  </style>
</head>
<body>

<div class="jumbotron">
  <div class="text-center">
    <a href=#><font size="10px">고조선 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;          
    <a href=#><font size="10px">삼국 시대 </font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">고려 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=#><font size="10px">조선 시대</font></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  </div>
</div>

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

<div class="container">    
  <div class="row">
    <div class="col-sm-5">
      <div class="panel panel-primary">
        <div class="panel-heading">고조선 시대 Hot 게시물~!</div>
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
      </div>
    </div>
    <div class="col-sm-5"> 
      <div class="panel panel-danger">
        <div class="panel-heading">삼국 시대 Hot 게시물~!</div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
      </div>
    </div>
    <div class="container-fluid">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <input type="text" placeholder="ID">
      <input type="text" placeholder="Password">
      <input type="button" value="로그인">
    </div>
  
     <div class="col-sm-2 sidenav">
     <br>
      <p><a href="#">회원가입</a></p> 
      <p><a href="#">내 정보</a></p>
      <p><a href="#">비밀번호 찾기</a>
      <p><a href="#">스크랩</a>
    </div>
  </div>
</div>
  </div>
</div><br>

<div class="container">    
  <div class="row">
    <div class="col-sm-10">
      <div class="panel panel-primary">
        <div class="panel-heading">고려 시대 게시물~!</div>
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
                    <td width=800px class='tt'>안녕하세요ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</td><%-- 55자리까지 --%>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>2</td>
                    <td>오늘머해</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>3</td>
                    <td>저녁은 뭐먹지?</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>4</td>
                    <td>살짝 배고파</td>
                    <td>이동욱</td>
                 </tr>
                 <tr>
                    <td>5</td>
                    <td>집에 갈 시간</td>
                    <td>이동욱</td>
                 </tr>
                 </tbody>
           </table>
      </div>
    </div>
    
     
  </div>
</div><br><br>

<footer class="container-fluid text-center">
  <p>역사 속의 인물이 되어, 즐기는 컨셉적 커뮤니티</p>  
</footer>

</body>
</html>