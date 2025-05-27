<%@page import="kr.co.sist.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> --%>
<jsp:useBean id="rDTO" class="kr.co.sist.board.RangeDTO" scope="page"/>
<jsp:setProperty property="*" name="rDTO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${site_name}"/></title>
<c:import url="${url}/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
 a{text-decoration: none; color:#333}
 a:hover{color:#5A90D0;}
</style>

<script type="text/javascript">
$(function(){
   
});//ready


</script>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${url}/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<div style="width:1200px">
<h3>자유 게시판</h3>
<div id="boardWrap">
<%
BoardService bs = new BoardService();
int totalCount=0;//총 게시물의 수
totalCount=bs.totalCount(null);
pageContext.setAttribute("totalCount", totalCount);

int pageScale=0;
pageScale=bs.pageScale();
pageContext.setAttribute("pageScale", pageScale);

int totalPage=0;
totalPage=bs.totalPage(totalCount, pageScale);
pageContext.setAttribute("totalPage", totalPage);

String tempPage=request.getParameter("currentPage");

int startNum;//시작번호
startNum=bs.startNum(pageScale, rDTO);
pageContext.setAttribute("startNum", rDTO.getStartNum());

int endNum;//끝 번호
endNum=bs.endNum(pageScale,rDTO);
pageContext.setAttribute("endNum", rDTO.getEndNum());

List<BoardDTO> boardList=bs.searchBoard(rDTO);
pageContext.setAttribute("boardList", boardList);

session.setAttribute("cntFlag", true);

%>
전체 : <c:out value="${totalPage }"/>페이지<br>
현재 : <c:out value="${rDTO.currentPage }"/>페이지
<%-- 총 게시물의 수 : ${totalCount }<br>
한 화면에 보여줄 게시물 수 : ${pageScale }<br>
총 페이지 수 : ${totalPage}<br>
시작번호 : ${startNum}<br>
끝번호 : ${endNum}<br> --%>
<div style="text-align: right;">
<a href="write_frm.jsp" class="btn btn-info btn-sm">글 작성</a>
</div>

<table class="table table-hover">
<thead>
<tr style="text-align: center">
<th style="width:80px">번호</th>
<th style="width:650px">제목</th>
<th style="width:120px">작성자</th>
<th style="width:200px">작성일</th>
<th style="width:100px">조회수</th>
</tr>
</thead>
<tbody>
<c:if test="${empty boardList}">
<tr>
<td colspan="5" style="text-align: center">
게시물이 없습니다<br>
<img src="../login/images/login_fail.jpg" style="width: 60px">
</td>
</tr>
</c:if>

<c:forEach var="bDTO" items="${boardList}" varStatus="i">
<tr>
<td><c:out value="${totalCount-(rDTO.currentPage-1)*pageScale-i.index}"/></td>
<td><a href="board_detail.jsp?num=${bDTO.num }"><c:out value="${bDTO.subject}"/></a></td>
<td><c:out value="${bDTO.id}"/></td>
<td><fmt:formatDate value="${bDTO.input_date}" pattern="yyyy-MM-dd a HH:mm:ss"/></td>
<td><c:out value="${bDTO.cnt}"/></td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
<div>
<c:forEach var="i" begin="1" end="${totalPage}" step="1">
[<a href="board_list.jsp?currentPage=${i}"><c:out value="${i}"/></a>]
</c:forEach>
</div>
</div>
</div> 
</main>
<footer class="text-body-secondary py-5">
<c:import url="${url}/common/jsp/footer.jsp"/>
</footer>


</body>
</html>