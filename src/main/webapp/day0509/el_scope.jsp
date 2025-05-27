<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="EL에서 scope객체의 사용"%>

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
<%
//1.변수선언
String msg="오늘은 비내리는 금요일";
//2.scope객체 할당
pageContext.setAttribute("msg", msg);

pageContext.setAttribute("name", "이장훈");
request.setAttribute("name", "주현석");
session.setAttribute("name", "홍준표");
application.setAttribute("name", "유연수");

%>
<!--3.el에서 scope객체를 사용하여 접근  -->
${msg},(${pageScope.msg })<br>
scope객체가 동일한 속성명을 가질 떄 EL에서 scope객체를 생략하면 
pageScope을 사용하게된다.<br>
<!--pageScope 객체에 이름이 같다면 접근 순서는 page>request>session>application  -->
${ name }<br>
pageScope : ${pageScope.name }<br>
requestScope : ${requestScope.name }<br>
sessionScope : ${sessionScope.name }<br>
applicationScope : ${applicationScope.name }<br>

</div>
</main>
<footer class="text-body-secondary py-5">
<jsp:include page="../common/jsp/footer.jsp"></jsp:include>
  
</footer>


</body>
</html>