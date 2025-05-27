<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean action태그로 web parameter 한 번에 처리"%>
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
<jsp:useBean id="param" class="day0508.Param" scope="page"/>
<!--setter method 호출 모든 파라메터 받기  -->
<jsp:setProperty name="param" property="*" name="param"/>

<h3>전달된 파라미터 결과</h3>
<pre>
<%= param.toString() %>
</pre>

<ul>
  <li>텍스트: <%= param.getTxt() %></li>
  <li>비밀번호: <%= param.getPass() %></li>
  <li>파일명: <%= param.getFile() %></li>
  <li>히든값: <%= param.getHid() %></li>
  <li>체크박스 flag: <%= param.getFlag() %></li>
  <li>셀렉트: <%= param.getSel() %></li>
  <li>텍스트영역: <%= param.getTa() %></li>
  <li>체크박스 배열(lang[]): 
    <%
      String[] langs = param.getLang();
      if (langs != null) {
        for (String l : langs) {
          out.print(l + " ");
        }
      } else {
          out.print("선택 없음");
      }
    %>
  </li>
</ul>

</div>
</main>
<footer class="text-body-secondary py-5">
</footer>
</body>
</html>
