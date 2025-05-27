<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="scope의 사용"%>
<%@ page import="day0508.Counter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scope 실습</title>
<jsp:include page="../common/jsp/external_file.jsp"></jsp:include>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px }
</style>
<script type="text/javascript">
$(function(){
  $("#btn").click(function(){
    $("#frm").submit();
  });
});
</script>
</head>
<body>
<header data-bs-theme="dark">
  <jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">

<h2>JSP useBean + scope(page/request/session) 예제</h2>

<%
// 요청 파라미터 가져오기
request.setCharacterEncoding("UTF-8");
String su = request.getParameter("su");

// 1. page scope
Counter counter = (Counter)pageContext.getAttribute("counter");
if (counter == null) {
    counter = new Counter();
    pageContext.setAttribute("counter", counter);
}

// 2. request scope
Counter counter2 = (Counter)request.getAttribute("counter2");
if (counter2 == null) {
    counter2 = new Counter();
    request.setAttribute("counter2", counter2);
}

// 3. session scope
Counter counter3 = (Counter)session.getAttribute("counter3");
if (counter3 == null) {
    counter3 = new Counter();
    session.setAttribute("counter3", counter3);
}

//4. application scope
Counter counter4 = (Counter)application.getAttribute("counter4");
if (counter4 == null) {
 counter4 = new Counter();
 application.setAttribute("counter4", counter4);
}

// 값이 입력되었으면 각 scope에 누적
if (su != null) {
    try {
        int val = Integer.parseInt(su);
        counter.setCnt(val);    // page
        counter2.setCnt(val);   // request
        counter3.setCnt(val);   // session
        counter4.setCnt(val);   // application
    } catch (NumberFormatException e) {
        out.println("<p style='color:red;'>숫자를 입력해주세요</p>");
    }
}
%>

<form id="frm" method="post">
  <label>증가할 숫자 입력: </label>
  <input type="text" name="su" value="1"/>
  <input type="button" id="btn" value="증가"/>
</form>

<hr>
<h4>pageContext (page scope)</h4>
<p>카운트: <%= counter.getCnt() %></p>

<h4>request (request scope)</h4>
<p>카운트: <%= counter2.getCnt() %></p>

<h4>session (session scope)</h4>
<p>카운트: <%= counter3.getCnt() %></p>

<h4>application (application scope)</h4>
<p>카운트: <%= counter4.getCnt() %></p>

<a href="req.jsp">req.jsp로 이동</a>

</div>
</main>
<footer class="text-body-secondary py-5">
</footer>
</body>
</html>
