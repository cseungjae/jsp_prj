<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그아웃"
    %>
<%-- <%@ include file="../common/jsp_prj/login_chk.jsp" %> --%>
<%
	session.removeAttribute("name");
	session.invalidate(); //세션 자체 무효화 > 메인
	response.sendRedirect("use_session_a.jsp");
	//무효화 이후에는 세션에서 값을 얻는 작업은 할 수 없다.
/* 	out.println(session.getAttribute("connectTime"));
	out.println(session.getAttribute("ip"));
	out.println(session.getAttribute("name")); */
%>
<!-- <meta http-equiv="refresh" content="0;use_session.jsp"> -->
<!-- <script type="text/javascript">
	alert("로그아웃 하심");
	location.herf="use_session_a.jsp";
</script> -->