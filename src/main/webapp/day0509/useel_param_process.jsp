<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="el을 사용한 출력"%>
<%@ page import="day0508.Param" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 파라미터 처리</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px }
</style>
<script type="text/javascript">
$(function(){
   
});
</script>
</head>
<body>
<header data-bs-theme="dark">
  <jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
request.setCharacterEncoding("UTF-8");
%>
<!--객체생성및 사용 범위 설정  -->
<%-- <jsp:useBean id="param" class="day0508.Param" scope="page"/> --%>
<!--setter method 호출 모든 파라메터 받기  -->
<%-- <jsp:setProperty name="param" property="*" name="param"/> --%>

<h3>전달된 파라미터 결과</h3>
<pre>
<%-- <%= param %> --%>
</pre>

<ul>
	<li>HTML Form Control의 name 속성의 값이 유일</li>
	<li><label>text</label>:${param.txt }</li>
	<li><label>text</label>:${param.age }</li>
	<li><label>password</label>:${param.pass }</li>
	<li><label>file</label>:${param.file }</li>
	<li><label>hidden</label>:${param.hid }</li>
	<li><label>checkbox</label>:${param.flag }</li>
	<li><label>select</label>:${param.sel }</li>
	<li><label>textarea</label>:${param.ta }</li>
	<li><label>checkbox여러개</label>:${param.ta }</li>
	${paramValues.lang }
 
</ul>

</div>
</main>
<footer class="text-body-secondary py-5">
</footer>
</body>
</html>
