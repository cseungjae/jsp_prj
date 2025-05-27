<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="헤더"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<jsp:include page="/common/jsp/external_file.jsp" />
<style type="text/css">
  #container { min-height: 600px; margin-top: 30px; margin-left: 20px; }
  a { margin-right: 15px; }
</style>
<script type="text/javascript">
$(function(){
  // 향후 기능 연결 시 여기에 작성
});
</script>
</head>
<body>
<header data-bs-theme="dark">
  <jsp:include page="/common/jsp/header.jsp" />
</header>
<main>
  <div id="container">
    <h2>메인 메뉴</h2>
    <a href="login/login_frm.jsp">로그인</a>
    <a href="member/member_frm.jsp">회원가입</a>
    <a href="member/member_list.jsp">회원목록</a>
    <a href="javascript:alert('준비 중입니다.')">상품소개</a>
    <a href="javascript:alert('준비 중입니다.')">영화소개</a>
  </div>
</main>
<footer class="text-body-secondary py-5">
  <jsp:include page="/common/jsp/footer.jsp" />
</footer>
</body>
</html>
