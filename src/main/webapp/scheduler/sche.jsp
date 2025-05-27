<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>달력</title>

<!-- favicon 설정 -->
<link rel="shortcut icon" href="http://192.168.10.97/jsp_prj/common/images/favicon.ico"/>
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS -->
<style type="text/css">
    #container { min-height: 600px; margin-top: 30px; margin-left: 20px; }
    a { text-decoration: none; color: #333; }
    #calendarWrap { width: 860px; }
    #calendarHeader { text-align: center; font-size: 25px; font-weight: bold; color: #333; margin-bottom: 20px; }
    .prevMonth, .nextMonth { color: #848AA3; font-size: 27px; cursor: pointer; }
    .btnToDay { font-size: 20px; border: 1px solid #333; background-color: #DFDFDF; padding: 2px 8px; }
    .calTab { border: 1px solid #333; }
    .calTab > thead > tr > th { width: 100px; height: 30px; border: 1px solid #333; text-align: center; }
    .calTab > tbody > tr > td { width: 100px; height: 80px; border: 1px solid #333; text-align: center; }
    .sunTitle { background-color: #FF6C6C; color: #FFFFFF; }
    .weekTitle { }
    .satTitle { background-color: blue; color:#FFFFFF; }
    /* 요일별 색 */
    .sunColor { color: #FF6C6C; }
    .weekColor { color: #333; }
    .satColor { color: #6CC0FF; }
    /* 오늘의 바닥색 */
    .todayBgColor { background-color: orange; }
    .weekBgColor { background-color: lime; }
</style>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
$(function() {
    // 준비
});

function moveCalendar(flag,year,month) {
	if(flag =='p'){
	year=month-1==0?year-1:year;
	month=month-1==0?12:month-1;
	}//end if
	if(flag =='n'){
		year= month+1==13?year+1:year;
		month=month+1==13?1:month+1;
	}//end fi

</script>
</head>

<body>
<header class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a href="index.jsp" class="navbar-brand d-flex align-items-center">
            <strong>템플릿</strong>
        </a>
    </div>
</header>

<main>
<div id="container">

<div id="calendarWrap">

<%
    Calendar cal = Calendar.getInstance();
    int nowYear = cal.get(Calendar.YEAR);
    int nowMonth = cal.get(Calendar.MONTH) + 1;
    int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>

<div id="calendarHeader">
    <span title="이전 월" class="prevMonth">&lt;</span>
    <span class="mainDate"><%= nowYear %>.<%= nowMonth %></span>
    <span title="다음 월" class="nextMonth">&gt;</span>
    <span title="오늘로 이동" class="btnToDay"><a href="#void">오늘</a></span>
</div>

<div id="calendarContainer">
<table class="calTab">
    <thead>
        <tr>
            <th class="sunTitle">일</th>
            <th class="weekTitle">월</th>
            <th class="weekTitle">화</th>
            <th class="weekTitle">수</th>
            <th class="weekTitle">목</th>
            <th class="weekTitle">금</th>
            <th class="satTitle">토</th>
        </tr>
    </thead>
    <tbody>
    <tr>
<%
    cal.set(Calendar.DAY_OF_MONTH, 1); // 1일로 세팅
    int startDayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
    int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 마지막 날짜

    // 1일 전까지 빈 칸 출력
    for (int i = 1; i < startDayOfWeek; i++) {
%>
        <td></td>
<%
    }

    // 날짜 출력
    for (int tempDay = 1; tempDay <= lastDay; tempDay++) {
        cal.set(Calendar.DAY_OF_MONTH, tempDay);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)

        // 요일별 색깔 지정
        String dayColorCss = "";
        if(dayOfWeek == Calendar.SUNDAY){
            dayColorCss = "sunColor";
        } else if(dayOfWeek == Calendar.SATURDAY){
            dayColorCss = "satColor";
        } else {
            dayColorCss = "weekColor";
        }

        // 오늘이면 배경색
        String todayCss = (tempDay == nowDay) ? "todayBgColor" : "weekBgColor";
%>
        <td class="<%= dayColorCss %> <%= todayCss %>"><%= tempDay %></td>
<%
        if(dayOfWeek == Calendar.SATURDAY){ // 토요일이면 줄바꿈
%>
    </tr><tr>
<%
        }
    }
%>
    </tr> <!-- 마지막 줄 닫기 -->
    </tbody>
</table>
</div>

</div>

</div>
</main>

<footer class="text-body-secondary py-5 bg-light">
    <div class="container">
        <p class="float-end mb-1"><a href="#">Back to top</a></p>
        <p class="mb-1"><strong style="font-size: 18px">2강의실</strong> 서울특별시 강남구 테헤란로 132(역삼동) 한독약품빌딩 8층 쌍용교육센터 <strong>Tel_02-3482-4632~5</strong></p>
    </div>
</footer>

</body>
</html>
