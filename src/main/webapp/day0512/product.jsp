<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="day0512.ProductService, day0512.ProductDTO, java.util.*"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<c:import url="http://192.168.10.98/jsp_prj/common/jsp/external_file.jsp"/>

<style type="text/css">
#container {
  min-height: 600px;
  margin-top: 30px;
  margin-left: 20px;
}
.card {
  width: 18rem;
  margin: 15px;
}
.card img {
  height: 200px;
  object-fit: cover;
}
</style>
<script type="text/javascript">
$(function(){
  // 버튼 클릭 시 코드 alert
  $(document).on("click", ".code-btn", function(){
    let code = $(this).data("code");
    alert("상품 코드: " + code);
  });
});
</script>
</head>
<body>
<header data-bs-theme="dark">
  <c:import url="http://192.168.10.98/jsp_prj/common/jsp/header.jsp"/>
</header>
<main>
<div id="container">
<%
  // 1. 서비스 객체 생성 및 상품 목록 가져오기
  ProductService service = new ProductService();
  List<ProductDTO> products = service.searchPrd();
  request.setAttribute("products", products);
%>

<div class="d-flex flex-wrap">
  <c:forEach var="p" items="${products}">
    <div class="card">
      <img src="images/${p.img}" class="card-img-top" alt="${p.prd}">
      <div class="card-body">
        <h5 class="card-title">${p.prd}</h5>
        <p class="card-text">
          가격:
          <fmt:formatNumber value="${p.price}" type="currency" currencySymbol="₩"/>
        </p>
        <button class="btn btn-primary code-btn" data-code="${p.code}">코드 확인</button>
      </div>
    </div>
  </c:forEach>
</div>

<c:if test="${empty products}">
  <p>상품이 없습니다.</p>
</c:if>

</div>
</main>
<footer class="text-body-secondary py-5">
  <c:import url="http://192.168.10.98/jsp_prj/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
