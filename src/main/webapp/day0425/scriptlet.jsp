<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="day0425.DataDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 테이블</title>

<!-- Bootstrap & favicon -->
<link rel="shortcut icon" href="http://192.168.10.97/jsp_prj/common/images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- CSS -->
<style type="text/css">
  #container {
    min-height: 600px;
    margin-top: 30px;
    margin-left: 20px;
  }
  .span {
    font-weight: bold;
    color: #3D8E4A;
    font-size: 24px;
  }
  table td {
    text-align: center;
    cursor: pointer;
    padding: 10px;
  }
  tr:hover {
    background-color: #f2f2f2;
  }
</style>

<!-- JavaScript -->
<script type="text/javascript">
$(function() {
  $(".gugu").on("click", function() {
    const dan = parseInt($(this).data("dan"));
    const num = parseInt($(this).data("num"));
    const result = dan * num;
    alert(`${dan} x ${num} = ${result}`);
  });
});
</script>
</head>

<body>
<header class="bg-dark text-white p-3">
  <div class="container">
    <h1 class="h4">템플릿 - 구구단</h1>
  </div>
</header>

<main>
  <div id="container">
    <%
      String name = "최승재";
    %>

    <% for (int i = 1; i < 7; i++) { %>
      <h<%=i%>><strong><%= name %></strong>입니다.</h<%=i%>>
    <% } %>

    <input type="text" placeholder="<%=name%>" /><br><br>

    <%
      int sum = 0;
      for (int i = 1; i <= 100; i++) {
        sum += i;
      }
    %>
    <div>1~100까지의 합은 <span class="span"><%=sum%></span>입니다.</div>

    <!-- ✅ 구구단 테이블 -->
    <div class="mt-4">
      <table class="table table-bordered">
        <tbody>
        <% for (int i = 1; i <= 9; i++) { %>
          <tr>
            <% for (int dan = 2; dan <= 9; dan++) { %>
              <td class="gugu" data-dan="<%=dan%>" data-num="<%=i%>">
                <%=dan%> x <%=i%>
              </td>
            <% } %>
          </tr>
        <% } %>
        </tbody>
      </table>

    	<%
List<DataDTO> list=new ArrayList<DataDTO>(); 
list.add(new DataDTO("img_01.jpg","뭐지?","너는아냐?","https://chatgpt.com" ) );
list.add(new DataDTO("img_02.jpg","몰루?","이장훈!아냐?","https://google.com" ) );
    	%>    
<div>
<%for(DataDTO dto : list){ %>
<div class="card" style="width: 18rem; float: left; margin-right: 5px; ">
  <img style="width: 300px;height: 160px" 
  src="http://192.168.10.97/jsp_prj/common/images/<%=dto.getImg() %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%=dto.getTitle()%></h5>
    <p class="card-text"><%=dto.getInfo()%></p>
    <a href="<%=dto.getUrl() %> " class="btn btn-primary">가즈아</a>
  </div>
</div>
<%}//end for %>
</div>

<div style="clear:both;">
<% LocalDate ld=LocalDate.now(); //현재 시간 얻기.
	int nowYear=ld.getYear();
	int nowMonth=ld.getMonthValue();
	int nowday=ld.getDayOfMonth();//현재 날짜 얻기.
	
%>
<select id="year">
<option value="none">---선택---</option>
<% int optionYear=0;
String selected=""	;
for(int tempYear=-2; tempYear<=3; tempYear++){
	optionYear=nowYear+tempYear;
	
	if(optionYear == nowYear){
		selected="selected='selected'";
	} //end if
%>
<option value="<%=optionYear %>"<%=selected %>> <%= optionYear %></option>
<%}//end for %>



</select>년
<select id='month'>
<option value="none">---선택---</option>
<%for(int month=1;month<13;month++) { %>
<option value="<%=month%>>"<%=month==nowMonth?"selected='selected'":"" %>> <%=month %> </option>
<% }//end for %>

</select>월
<select id="day">
<option value="none">---선택---</option>
<%for(int day=1;day<nowday; day++){ %>
<option value="<%=day%>" <%=day==nowday ? "selected='selected'" : "" %>><%=day%></option>

<%}//end for %>

</select>

</div>
  	      
        
    </div>
      </div>
</main>

<footer style="class=:both;" class="text-body-secondary py-5 ">
  <div class="container">
    <p class="float-end mb-1"><a href="#">Back to top</a></p>
    <p class="mb-1">
      <strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 
      <strong>Tel_02-3482-4632~5</strong>
    </p>
  </div>
</footer>
</body>
</html>
