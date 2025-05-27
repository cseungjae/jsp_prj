<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방문자 수 표시</title>
</head>
<body>
<%
    Integer count = (Integer)application.getAttribute("visitCount");
    if (count == null) {
        count = 1;
    } else {
        count++;
    }
    application.setAttribute("visitCount", count);

    String countStr = count.toString();
%>

<h2>당신은 이 페이지의</h2>

<%
    for (int i = 0; i < countStr.length(); i++) {
        char digit = countStr.charAt(i);
%>
    <img src="images/num_<%= digit %>.png" alt="<%= digit %>" style="width:30px;">
<%
    }
%>

<h2>번째 방문자입니다.</h2>

</body>
</html>
