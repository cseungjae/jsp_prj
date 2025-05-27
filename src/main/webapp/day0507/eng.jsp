<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="헤더"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/jsp/external_file.jsp"></jsp:include>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}
</style>
<script type="text/javascript">

$(function(){
	
});//ready

</script>
</head>
<body>
<header data-bs-theme="dark">
  <jsp:include page="../common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<h2>한국어 페이지로 방문하셨습니다.</h2>
이름:<%=request.getParameter("name") %>
나이:<%=request.getParameter("age") %>
<a href="javascript:history.back()">뒤로</a>
</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
  
</footer>


</body>
</html>