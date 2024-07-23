<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Schedule</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
  <link rel="stylesheet" href="../../components/css/defaultInput.css" />
  <link rel="stylesheet" href="../../css/schedulePage.css" />
</head>
<body>
  <div id="year">
    <span id="btn-decreaseYear">-</span>
    <span>2024</span>
    <span id="btn-increaseYear">+</span>
  </div>

  <input id="month" type="button" class="btn" value="1" />

  <div class="columnContainer">
    <div class="rowContainer">
      <div class="dayOfTheWeek">일</div>
      <div class="dayOfTheWeek">월</div>
      <div class="dayOfTheWeek">화</div>
      <div class="dayOfTheWeek">수</div>
      <div class="dayOfTheWeek">목</div>
      <div class="dayOfTheWeek">금</div>
      <div class="dayOfTheWeek">토</div>
    </div>

    <div class="columnContainer">
      <div class="rowContainer">
        <div class="oddWeek">1</div>
        <div class="oddWeek">2</div>
        <div class="oddWeek">3 <span class="scheduleCount">3개</span> </div>
        <div class="oddWeek">4</div>
        <div class="oddWeek">5</div>
        <div class="oddWeek">6</div>
        <div class="oddWeek">7</div>
      </div>
      <div class="rowContainer">
        <div class="evenWeek">1</div>
        <div class="evenWeek">2</div>
        <div class="evenWeek">3</div>
        <div class="evenWeek">4</div>
        <div class="evenWeek">5</div>
        <div class="evenWeek">6</div>
        <div class="evenWeek">7</div>
      </div>
      <div class="rowContainer">
        <div class="oddWeek">1</div>
        <div class="oddWeek">2</div>
        <div class="oddWeek">3</div>
        <div class="oddWeek">4</div>
        <div class="oddWeek">5</div>
        <div class="oddWeek">6</div>
        <div class="oddWeek">7</div>
      </div>
      <div class="rowContainer">
        <div class="evenWeek">1</div>
        <div class="evenWeek">2</div>
        <div class="evenWeek">3</div>
        <div class="evenWeek">4</div>
        <div class="evenWeek">5</div>
        <div class="evenWeek">6</div>
        <div class="evenWeek">7</div>
      </div>
      <div class="rowContainer">
        <div class="oddWeek">1</div>
        <div class="oddWeek">2</div>
        <div class="oddWeek">3</div>
        <div class="oddWeek">4</div>
        <div class="oddWeek">5</div>
        <div class="oddWeek">6</div>
        <div class="oddWeek">7</div>
      </div>
    </div>
  </div>
</body>
