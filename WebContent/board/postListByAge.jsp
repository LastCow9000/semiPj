<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
      <div class="row">
         <div class="col-sm-10">
            <div class="panel panel-primary">

            <c:choose>
            <c:when test="${requestScope.flag }">
               <div class="panel-heading">${requestScope.ageName} 검색 게시물~!</div>
               </c:when>
               <c:otherwise>
               <div class="panel-heading">${requestScope.ageName} 게시물~!</div>
               </c:otherwise>
              </c:choose>
               <table class="table hoh">
                  <thead>
                     <tr>
                        <th align="center">번호</th>
                        <th colspan="2" align="center">제목</th>
                        <th align="center">작성자</th>
                        <th align="center">좋아요</th>
                        <th align="center">조회수</th>
                        <th align="center">게시일</th>
                     </tr>
                  </thead>
                  
                  <tbody>

                  <c:set var="pb" value="${requestScope.listvo.pagingBean}" />
                  <tr bgcolor='orange'>

                     <td align="center">${requestScope.noticeNumber}</td>
                     <td colspan="2" align="center"><a href="${pageContext.request.contextPath}/front?command=noticeDetailpost&postNo=${requestScope.noticeList[0].postNo}">${requestScope.noticeList[0].title}</a></td>
                     <td align="center">${requestScope.noticeList[0].memberVO.nickName}</td>
                     <td align="center">${requestScope.noticeList[0].likeCount}</td>
                     <td align="center">${requestScope.noticeList[0].viewCount}</td>
                     <td align="center">${requestScope.noticeList[0].regDate}</td>
                  </tr>
                  
                  <c:forEach items="${requestScope.listvo.list}" var="list" varStatus="status">
                  <tr>
                     <td align="center">
                        ${requestScope.totalPostCount-((pb.nowPage-1)*pb.postCountPerPage+status.index)}
                     </td>
                     <td colspan="2" align="center"><a href="${pageContext.request.contextPath}/front?command=detailpost&postNo=${list.postNo}&rnum=${requestScope.totalPostCount-((pb.nowPage-1)*8+status.index)}">
                     ${list.title} <span class="label label-info">${list.replyCount}</span>
                     </a></td>
                     <td align="center">${list.memberVO.nickName}</td>
                     <td align="center">${list.likeCount}</td>
                     <td align="center">${list.viewCount}</td>
                     <td align="center">${list.regDate}</td>
                  </tr>
                  </c:forEach>
                  
                  </tbody>
               </table>
               
              </div><%-- panel-primary --%>
                       
                       
            <%-- 글쓰기 및 공지사항 작성 버튼 --%>
            <c:if test="${sessionScope.memberVO.ageName == requestScope.ageName && sessionScope.memberVO != null}">
            <div align="right">
               <button type="submit" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/front?command=writepostform'">글쓰기</button>
            </div>
            </c:if>
            <c:if test="${sessionScope.memberVO.id =='adminmts'}">
            <div align="right">
               <button type="submit" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/front?command=writeNotice'">공지사항 작성</button>
               </div>
            </c:if>
               
               
               <%-- 페이징 처리 --%>
               <c:set var="pb" value="${requestScope.listvo.pagingBean}" />
               <div class="pagingArea">
                  <div class="pagination">
                  <c:choose>
                    <c:when test="${requestScope.flag&&requestScope.ageName!=null}">
                      <%-- 왼쪽 페이지 이동 --%>
                           <c:if test="${pb.previousPageGroup}">
                              <a href="front?command=ageSearch&agename=${requestScope.ageName}&option=${requestScope.option}&word=${requestScope.word}&pageNo=${pb.startOfPageGroup-1}">&laquo;</a>
                           </c:if>
                    </c:when>
                     <c:when test="${requestScope.flag }">
                       <%-- 왼쪽 페이지 이동 --%>
                           <c:if test="${pb.previousPageGroup}">
                              <a href="front?command=searchall&option=${requestScope.option}&word=${requestScope.word}&pageNo=${pb.startOfPageGroup-1}">&laquo;</a>
                           </c:if>
                     </c:when>
                     <c:otherwise>
                   <%-- 왼쪽 페이지 이동 --%>
                           <c:if test="${pb.previousPageGroup}">
                              <a href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${pb.startOfPageGroup-1}">&laquo;</a>
                           </c:if>
                     </c:otherwise>
                   </c:choose>
                   
                     <c:forEach var="i" begin="${pb.startOfPageGroup}" end="${pb.endOfPageGroup}">
                        <c:choose>
                           <c:when test="${pb.nowPage!=i}">
                           <c:choose>
                              <c:when test="${requestScope.flag&&requestScope.ageName!=null}">
                                 
                                 <a href="front?command=ageSearch&agename=${requestScope.ageName}&option=${requestScope.option}&word=${requestScope.word}&pageNo=${i}">${i}</a>
                                 
                              </c:when>
                              <c:when test="${requestScope.flag }">
                              <a href="front?command=searchall&option=${requestScope.option}&word=${requestScope.word}&pageNo=${i}">${i}</a>
                              </c:when>
                              <c:otherwise>
                              <a href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${i}">${i}</a>
                              </c:otherwise>
                           </c:choose>
                           </c:when>
                           <c:otherwise>
                              <a href="#" class="active">${i}</a>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
                      <c:choose>
                    <c:when test="${requestScope.flag&&requestScope.ageName!=null}">
                         <%-- 오른쪽 페이지 이동 --%>
                     <c:if test="${pb.nextPageGroup}">
                        <a href="front?command=ageSearch&agename=${requestScope.ageName}&option=${requestScope.option}&word=${requestScope.word}&pageNo=${pb.endOfPageGroup+1}">&raquo;</a>
                     </c:if>
                    </c:when>
                     <c:when test="${requestScope.flag }">
                          <%-- 오른쪽 페이지 이동 --%>
                     <c:if test="${pb.nextPageGroup}">
                        <a href="front?command=searchall&option=${requestScope.option}&word=${requestScope.word}&pageNo=${pb.endOfPageGroup+1}">&raquo;</a>
                     </c:if>
                     </c:when>
                     <c:otherwise>
                       <%-- 오른쪽 페이지 이동 --%>
                     <c:if test="${pb.nextPageGroup}">
                        <a href="front?command=agelist&agename=${requestScope.ageName}&pageNo=${pb.endOfPageGroup+1}">&raquo;</a>
                     </c:if>
                           </c:otherwise>
                           </c:choose>
                 
                  </div>
               </div> <%--페이징처리 끝 --%>

        </div> <%-- col --%>
     </div> <%-- row --%>
  </div> <%-- container --%>