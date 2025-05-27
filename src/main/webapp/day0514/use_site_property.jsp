<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    <%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${site_name }"></c:out></title>
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
<c:out value="${url}"></c:out><br>
<c:out value="${uploadURL}"></c:out><br>
<c:out value="${logo}"></c:out><br>
<c:out value="${site_name}"></c:out><br>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
  
</footer>


</body>
</html>