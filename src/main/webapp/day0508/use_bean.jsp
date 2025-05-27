<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="useBean action tag 사용"%>
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

<!-- 객체생성과 scope 객체 설정 -->
<jsp:useBean id="dDto" class="day0508.DataDTO" scope="page"/>  <!-- 새로고침하면 객체가 계속 생성 -->
<%-- 
<jsp:useBean id="dDto" class="day0508.DataDTO" scope="request"/>  <!-- 새로고침하면 객체가 계속 생성 -->
<jsp:useBean id="dDto" class="day0508.DataDTO" scope="session"/>  <!-- 새로고침해도 객체가 한번만 생성 --> 
<jsp:useBean id="dDto" class="day0508.DataDTO" scope="application"/>  <!-- 새로고침해도 객체가 한번만 생성 --> 
--%>

<!-- setter method 호출 -->
<jsp:setProperty property="name" value="이일삼" name="dDto"/>
<jsp:setProperty property="myAge" value="27" name="dDto"/>


<!-- getter method 호출 : web browser 출력가능 -->
이름: <jsp:getProperty property="name" name="dDto"/><br>
나이 :<jsp:getProperty property="myAge" name="dDto"/><br>

<% 
	out.print(dDto);
	out.println("<br>");
	//<jsp:useBean 으로 생성된 객체는 Java Code에서도 사용할 수 있다.
	dDto.setName("양귀비");
	dDto.setMyAge(26);
%>
이름 : <%=dDto.getName() %> <br>
나이 : <%=dDto.getMyAge() %> <br>
<%-- <%= dDto %> --%>

이름은 <%=dDto.getName()%>이고, 나이는 <%=dDto.getMyAge() %>입니다.

</div>
</main>
<footer class="text-body-secondary py-5">
  
</footer>


</body>
</html>