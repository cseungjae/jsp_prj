<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
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

<script type="text/javascript">
$(function(){
  $("#btn").click(function () {
    $.ajax({
      url: "../day0515/json_obj2.jsp", // JSON 데이터 제공 JSP
      type: "GET",
      dataType: "json", // 소문자 json!
      error: function(xhr){
        alert("문제 발생! 잠시 후 다시 시도해주세요.");
        console.log(xhr.status);
      },
      success: function(jsonObj){
        // 부가 정보 표시
        $("#deptCnt").html(jsonObj.dataLength);
        $("#createDate").html(jsonObj.pubDate);

        var createTr;
        $("#deptTab tbody").empty();

        // 데이터가 없을 경우
        if (!jsonObj.resultFlag) {
          $("#deptTab tbody").append(
            "<tr><td colspan='3'>부서정보가 존재하지 않습니다.</td></tr>"
          );
        } else {
          // 실제 데이터 반복 출력
          $.each(jsonObj.date, function(i, jsonTemp){
            createTr =
              "<tr>" +
                "<td><a href='emp_list.jsp?deptno=" + jsonTemp.deptno + "'>" +
                  jsonTemp.deptno +
                "</a></td>" +
                "<td>" + jsonTemp.dname + "</td>" +
                "<td>" + jsonTemp.loc    + "</td>" +
              "</tr>";
            $("#deptTab tbody").append(createTr);
          });
        }
      }
    }); // ajax
  }); // click
}); // ready
</script>
</head>
<body>
<header data-bs-theme="dark">
  <c:import url="${url}/common/jsp/header.jsp"/>
</header>

<main>
<div id="container">
  <input type="button" value="부서정보조회" class="btn btn-success" id="btn">

  <div>
    <strong>부서수</strong>: <span id="deptCnt"></span><br/>
    <strong>데이터 생성일</strong>: <span id="createDate"></span><br/>
  </div>

  <div style="width: 360px">
    <table id="deptTab" class="table table-hover">
      <thead>
        <tr>
          <th style="width: 60px">번호</th>
          <th style="width: 150px">부서번호</th>
          <th style="width: 150px">위치</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

  <div style="height: 400px">
    <h2><span id="deptno"></span>부서 사원 정보</h2>
  </div>

  <div style="width: 650px">
    <table id="empTab" class="table table-hover">
      <thead>
        <tr>
          <th style="width: 60px">번호</th>
          <th style="width: 80px">사원번호</th>
          <th style="width: 120px">사원명</th>
          <th style="width: 150px">직무</th>
          <th style="width: 120px">입사일</th>
          <th style="width: 120px">연봉</th>
        </tr>
      </thead>
      <tbody></tbody>
    </table>
  </div>

</div>
</main>

<footer class="text-body-secondary py-5">
  <c:import url="${url}/common/jsp/footer.jsp"/>
</footer>

</body>
</html>
