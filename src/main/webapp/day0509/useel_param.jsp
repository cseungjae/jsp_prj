<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    info="El을 사용한 web parameter"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 파라미터 입력</title>
<jsp:include page="../common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px }
</style>
<script type="text/javascript">
$(function(){
  $("#btnPost").click(function(){
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
<h2>EL을 사용한 web parameter 처리</h2>
<form name="frm" id="frm" action="useel_param_process.jsp" method="post">
<ul>
<li><label>text</label><input type="text" name="txt" autofocus="autofocus"/></li>
<li><label>password</label><input type="password" name="pass"/></li>
<li><label>file</label><input type="text" name="file"/></li>
<li><label>hidden</label><input type="hidden" name="hid" value="5월은 쉬는 날 끝"/></li>
<li><label>checkbox(flag)</label><input type="checkbox" name="flag" value="flag"/></li>
<li><label>select</label>
  <select name="sel">
    <option value="자바">자바</option>
    <option value="오라클">Oracle</option>
    <option value="JDBC">JDBC</option>
    <option value="HTML">HTML</option>
  </select>
</li>
<li><label>textarea</label><textarea name="ta"></textarea></li>
<li><label>checkbox(lang[])</label>
  <input type="checkbox" name="lang" value="Java"/>Java SE
  <input type="checkbox" name="lang" value="C/C++"/>C/C++
  <input type="checkbox" name="lang" value="JSP"/>JSP
  <input type="checkbox" name="lang" value="PyThon"/>PyThon
  <input type="checkbox" name="lang" value="ASP"/>ASP
</li>
<li>
  <input type="button" value="POST전송" class="btn btn-success" id="btnPost" />
</li>
</ul>
</form>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>
