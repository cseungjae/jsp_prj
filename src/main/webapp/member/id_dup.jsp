<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kr.co.sist.member.MemberService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>아이디 중복확인</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
  <style>
    #wrap { position: relative; margin: 0 auto; width: 500px; }
    #inputDiv { margin-top: 50px; text-align: center; }
    #resultDiv { margin-top: 20px; text-align: center; }
    #btn2 { margin-top: 15px; }
  </style>
</head>
<body>
<%
  String id = request.getParameter("id");
  boolean idFlag = false;
  if (id != null && !id.trim().equals("")) {
    MemberService ms = MemberService.getInstance();
    idFlag = ms.searchId(id);
  }
  pageContext.setAttribute("idFlag", idFlag);
%>

<div id="wrap">
  <div id="inputDiv">
    <form id="frm" method="get">
      <label for="id">아이디</label>
      <input type="text" name="id" id="id" value="<c:out value='${param.id}'/>" autofocus />
      <input type="submit" value="중복확인" class="btn btn-primary btn-sm" />
    </form>
  </div>

  <div id="resultDiv">
    <c:if test="${not empty param.id}">
      <span><c:out value="${param.id}"/></span>는
      <c:set var="msg" value="사용 가능" />
      <c:set var="color" value="blue" />
      <c:if test="${idFlag}">
        <c:set var="msg" value="사용 불가" />
        <c:set var="color" value="red" />
      </c:if>
      <span style="color:${color}"><c:out value="${msg}"/></span>한 아이디입니다.

      <input type="hidden" id="tempId" value="${param.id}" />
      <c:if test="${not idFlag}">
        <input type="button" value="사용" class="btn btn-success btn-sm" id="btn2" />
      </c:if>
    </c:if>
  </div>
</div>

<script>
$(function() {
  $('#btn2').click(function() {
    const id = $('#tempId').val();
    if (id === "") {
      alert("아이디가 비어 있습니다.");
      return;
    }
    opener.document.frm.id.value = id;
    opener.document.frm.id.removeAttribute('readonly');
    opener.document.frm.id.setAttribute('readonly', 'readonly');
    window.close();
  });
});
</script>

</body>
</html>
