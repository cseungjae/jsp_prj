<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.util.List, day0430.DataDTO"
         info="업무처리한 결과를 받아와서 응답할 화면을 만들어서 응답하는 일" %>
<%
    // 포워드로 넘어온 결과를 받는다.
    String name = (String) request.getAttribute("name");
    List<DataDTO> list = (List<DataDTO>) request.getAttribute("list");
System.out.println(name);
System.out.println(list);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= name %>님 어서오고</title>

  <!-- favicon 설정 -->
  <link rel="shortcut icon"
        href="http://192.168.10.97/jsp_prj/common/images/favicon.ico"/>
  <!-- bootstrap CDN -->
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <style type="text/css">
    #container {
      min-height: 600px;
      margin-top: 30px;
      margin-left: 20px;
    }
  </style>
  <!-- jquery CDN -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script type="text/javascript">
    function msg() {
      alert("이름이 없습니다.");
      location.href = "forward_a.jsp";
    }
    <%
    if(name == null){%>
    	msg();
    <%}
    %>
    
  </script>
</head>
<body>
<header data-bs-theme="dark">
  <div class="collapse text-bg-dark" id="navbarHeader">
    <div class="container">
      <div class="row">
        <div class="col-sm-8 col-md-7 py-4">
          <h4>템플릿</h4>
          <p class="text-body-secondary">모름.</p>
        </div>
        <div class="col-sm-4 offset-md-1 py-4">
          <h4>Contact</h4>
          <ul class="list-unstyled">
            <li><a href="https://google.com" class="text-white">구글에서 찾기</a></li>
            <li><a href="https://chatgpt.com/" class="text-white">지피티 찾기</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
      <a href="index.jsp" class="navbar-brand d-flex align-items-center">
        <!-- SVG 생략 -->
        <strong><%= name %></strong>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
              data-bs-target="#navbarHeader" aria-controls="navbarHeader"
              aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </div>
</header>

<main>
  <div id="container">
   <select>
   	<option value="none">---관심있는 과목선택</option>
   <%
   if(list != null){
   	  for(DataDTO dd:list)	{%>
	   	<option value="<%=dd.getCode()%>"><%=dd.getSubject()%>---관심있는 과목선택</option>
   		  
   	<%}
   }
   %>  
	   
   
   
   
   </select>
  </div>
</main>

<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1"><a href="#">Back to top</a></p>
    <p class="mb-1">
      <strong style="font-size: 18px">2강의실</strong> 
      서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 
      <strong>Tel_02-3482-4632~5</strong>
    </p>
  </div>
</footer>
</body>
</html>
