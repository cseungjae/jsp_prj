<%@ page import="kr.co.sist.member.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info="회원가입 처리" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
<jsp:include page="../common/jsp/external_file.jsp"/>

<style type="text/css">
  #container { min-height: 600px; margin-top: 30px; margin-left: 20px }
  .result-img { width: 300px; margin: 20px 0; }
  .center-text { text-align: center; }
</style>
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

<!-- DTO 바인딩 -->
<jsp:useBean id="mDTO" class="kr.co.sist.member.MemberDTO" scope="page"/>
<jsp:setProperty name="mDTO" property="*"/>

<%
  mDTO.setIp(request.getRemoteAddr());

  boolean result = false;
  try {
      MemberService ms = MemberService.getInstance();
      result = ms.addMember(mDTO);
  } catch(Exception e) {
      e.printStackTrace();
  }

  pageContext.setAttribute("addResult", result);
%>

<c:choose>
  <c:when test="${addResult}">
    <!-- 회원가입 성공 -->
    <div class="center-text">
      <h2>회원가입을 축하드립니다.</h2>
      <img src="../common/images/boss.png" alt="회원가입 성공" class="result-img" />
      <p style="font-size: 20px;">
        <strong><c:out value="${mDTO.name}"/></strong> 님, 환영합니다!
      </p>
      <p><a href="index.html" class="btn btn-success">메인화면 돌아가기</a></p>
    </div>
  </c:when>
  <c:otherwise>
    <!-- 회원가입 실패 -->
    <div class="center-text">
      <h2 style="color:red;">회원가입이 정상적으로 이루어지지 않았습니다.</h2>
      <img src="../common/images/boss.png" alt="회원가입 실패" class="result-img"/>
      <h3>잠시 후 다시 시도해주세요.</h3>
      <a href="http://192.168.10.97/jsp_prj/index.jsp" class="btn btn-secondary">메인화면</a>
      <a href="javascript:history.back()" class="btn btn-warning">다시 시도</a>
    </div>
  </c:otherwise>
</c:choose>
<%
  System.out.println("== 회원가입 요청 받은 값 ==");
  System.out.println("id: " + mDTO.getId());
  System.out.println("pass: " + mDTO.getPass());
  System.out.println("name: " + mDTO.getName());
  System.out.println("email: " + mDTO.getEmail());
  System.out.println("domain: " + mDTO.getDomain());
  System.out.println("tel: " + mDTO.getTel());
  System.out.println("zipcode: " + mDTO.getZipcode());
  System.out.println("addr: " + mDTO.getAddr());
%>
</div>
</main>
<footer class="text-body-secondary py-5">
  <jsp:include page="../common/jsp/footer.jsp"/>
</footer>
</body>
</html>
