<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CDN -->
    <link rel="stylesheet" type="text/css" 
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" />
    <style>
        .subDiv { margin-top: 5px; }
    </style>
    <!-- jQuery CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
	<script type="text/javascript">
	
	</script>
</head>
<body>
안녕하세요?
<%String name="이장훈"; %><br>
<marquee scrollamount="15"direction="right">
내이름은<strong><%= name %>입니다.</strong>
</marquee> 

<br>
</body>
</html>