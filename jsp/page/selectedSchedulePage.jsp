<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css">
  <link rel="stylesheet" href="../../css/selectedSchedulePage.css">
  <title>Schedule</title>
</head>
<body>
  <div class="date">
    <div class="date__year">
      2024
    </div>
    <div class="date__month">
      1월
    </div>
    <div class="date__day">
      12일
    </div>
  </div>
  <div class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <div class="schedule__time">09:00 - 12:00</div>
      <input class="schedule__time-input" type="hidden">
      <div class="schedule__content">일정 입니다.</div>
      <input class="schedule__content-input" type="hidden">
    </div>
    <input type="button" class="schedule-wrapper__modify-btn" value="수정">
    <input type="button" class="schedule-wrapper__delete-btn" value="삭제">
  </div>
</body>