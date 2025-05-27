<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="http://192.168.10.98/jsp_prj/common/jsp/external_file.jsp"/>
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
<c:import url="http://192.168.10.98/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">

<%
    // 1. 메세지 초기화
    String msg = "JSP Standard Tag Library";
    String cls = "java.lang.String";
    Exception ex = null; // 예외를 JSTL에서 출력하기 위해 EL로 넘길 변수

    try {
        if(new Random().nextBoolean()){
            cls = "java.lang.String1"; // 존재하지 않는 클래스 지정하여 예외 유도
        }
        Class.forName(cls);
    } catch(Exception e){
        ex = e; // 예외를 변수에 저장
    }

    request.setAttribute("e", ex); // EL에서 접근할 수 있도록 request scope에 저장
    request.setAttribute("msg", msg); // EL에서 출력할 수 있도록 msg도 저장
%>

<c:if test="${empty e}">
	${msg}
</c:if>

<c:if test="${not empty e}">
	문제가 발생하였습니다. 잠시 후 다시 시도.<br>
	<c:out value="${e}"/>
</c:if>

</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="http://192.168.10.89/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
