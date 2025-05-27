<%@page import="java.util.Random"%>
<%-- <%@page import="kr.co.sist.member.login.LoginResultDTO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
    
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@ include file="../common/jsp/login_chk.jsp" %> 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ site_name }"/></title>
<c:import url="${ url }/common/jsp/external_file.jsp"/>
<style type="text/css">
 #container{ min-height: 600px; margin-top: 30px; margin-left: 20px}

 td{padding-top: 10px;padding-bottom: 10px}
</style>

<!-- summernote -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<!-- summernote -->

<script type="text/javascript">
$(function(){
	$('#summernote').summernote({
		 placeholder: '자유롭게 자신의 생각을 작성해주세요',
	        tabsize: 2,
	        height: 240,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['picture']]
	         
	        ]
	});
	
	$("#btnWrite").click(function(){
		//제목, 내용 등 필수 입력사항에 대한 유효성 검증
		
		$("#writeFrm").submit();
	})
});//ready

</script>
</head>
<body>
<header data-bs-theme="dark">
 <c:import url="${ url }/common/jsp/header.jsp"/>

</header>
<main>
<div id="container">
<div id="writeWrap" style="width: 620px; margin:0px auto">

<div>
<form action="write_process.jsp" method="post" id="writeFrm">
<table>
<tr>
<th colspan="2" style="text-align: center;">
	<h3>글 작성</h3>
</th>
</tr>
<tr style="height:40px">
<td>제목</td>
<td><input type="text" name="subject" id="subject" 
	style="width:520px;border:1px solid #CDCDCD;height:30px"/></td>
</tr>
<tr>
<td>내용</td>
<td>

  <textarea id="summernote" name="content"></textarea>

</td>
</tr>
<tr>
<td>작성자 ID</td>
<td><strong><c:out value="${userData.id }"/></strong></td>
</tr>
<tr>
<td colspan="2" style="text-align: center;">
<input type="button" value="글쓰기" id="btnWrite" class="btn btn-success btn-sm"/>
<a href="javascript:history.back()" class="btn btn-info btn-sm">뒤로</a>
</td>
</tr>

</table>
</form>
</div>
</div>

</div>
</main>
<footer class="text-body-secondary py-5">
 <c:import url="${ url }/common/jsp/footer.jsp"/>

</footer>


</body>
</html>