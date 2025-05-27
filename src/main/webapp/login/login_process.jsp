<%@ page import="kr.co.sist.member.login.LoginService" %>
<%@ page import="kr.co.sist.member.login.loginDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String pass = request.getParameter("pass");

loginDTO lDTO = new loginDTO();
lDTO.setId(id);
lDTO.setPass(pass);

LoginService ls = new LoginService();
boolean flag = ls.loginProcess(lDTO, session);

if(flag){
    response.sendRedirect("main.jsp"); // 성공 시 이동
} else {
%>
<script>
    alert("로그인 실패: 아이디 또는 비밀번호 오류");
    history.back();
</script>
<%
}
%>
