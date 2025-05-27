<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${site_name}"/></title>
<c:import url="${url}/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px }
</style>
</head>
<body>
<header data-bs-theme="dark">
<c:import url="${url}/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
int maxSize = 1024 * 1024 * 600;
int limitSize = 1024 * 1024 * 10;

try {
    MultipartRequest mr = new MultipartRequest(
        request, 
        saveDir.getAbsolutePath(), 
        maxSize, 
        "UTF-8", 
        new DefaultFileRenamePolicy()
    );

    String uploader = mr.getParameter("uploader");
    String originalName = mr.getOriginalFileName("upfile");
    String newName = mr.getFilesystemName("upfile");

    File readFile = new File(saveDir.getAbsolutePath() + File.separator + newName);

    if (readFile.length() > limitSize) {
        readFile.delete();
%>
<p style="color:red;">⚠ 최대 업로드 가능한 파일 크기는 10MB (10,485,760 byte)입니다.</p>
<%
    } else {
%>
업로더: <%= uploader %><br>
원본 파일명: <%= originalName %><br>
저장된 파일명: <%= newName %><br>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
%>
<p style="color:red;">⚠ 업로드 중 오류가 발생했습니다.</p>
<%
}
%>
</div>
</main>
<footer class="text-body-secondary py-5">
<c:import url="${url}/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
