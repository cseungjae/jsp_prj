<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" info=""%>
<%@ include file="../common/jsp/site_config.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${site_name}"/></title>

<!-- ✅ 수정된 import 경로 -->
<c:import url="${url}/common/jsp/external_file.jsp"/>

<style type="text/css">
 #container { min-height: 600px; margin-top: 30px; margin-left: 20px }
</style>

<script type="text/javascript">
$(function() {
	  $("#txt").click(function () {
	    $.ajax({
	      url: "${url}/day0515/ajax.txt",
	      type: "get",
	      dataType: "text",
	      error: function(xhr){
	        $("#output").html("에러코드 : "+xhr.status+", 에러메시지 : " + xhr.statusText);
	      },
	      success: function(textData){
	        $("#output").html("<strong>"+textData+"</strong>");
	      }
	    });
	  });

	  $("#html").click(function () {
	    $.ajax({
	      url: "ajax.html",
	      type: "GET",
	      dataType: "html",
	      error: function(xhr){
	        console.log(xhr.status + "/" + xhr.statusText);
	      },
	      success: function(html){
	        $("#output").html(html);
	      }
	    });
	  });

	  $("#xml").click(function () {
	    $.ajax({
	      url: "ajax.xml",
	      type: "GET",
	      dataType: "xml",
	      error: function(xhr){
	        console.log(xhr.status + "/" + xhr.statusText);
	      },
	      success: function(xmlData){
	        $("#output").html(
	          "이름: " + $(xmlData).find("name").text() +
	          "<br>메시지: " + $(xmlData).find("msg").text()
	        );
	      }
	    });
	  });

	  $("#json").click(function () {
	    $.ajax({
	      url: "ajax.json",
	      type: "GET",
	      dataType: "json",
	      error: function(xhr){
	        console.log(xhr.status + "/" + xhr.statusText);
	      },
	      success : function(jsonObj){
	        $("#output").html("이름: " + jsonObj.name + "<br>주소: " + jsonObj.addr);
	      }
	    });
	  });
	});


</script>
</head>
<body>
<header data-bs-theme="dark">
  <c:import url="${url}/common/jsp/header.jsp"/>
</header>
<main>
  <div id="container">
    <input type="button" value="TEXT" class="btn btn-success" id="txt"/>
    <input type="button" value="HTML" class="btn btn-danger" id="html"/>
    <input type="button" value="XML" class="btn btn-info" id="xml"/>
    <input type="button" value="JSON" class="btn btn-warning" id="json"    />
  
  <div id="output"></div>
  <input type="text" name="name" id="name"/><br>
  <input type="text" name="addr" id="addr"/><br>
  </div>
</main>
<footer class="text-body-secondary py-5">
  <c:import url="${url}/common/jsp/footer.jsp"/>
</footer>
</body>
</html>
