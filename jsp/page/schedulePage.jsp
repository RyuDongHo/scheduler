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
  <link rel="stylesheet" href="../../components/css/aside.css">
  <link rel="stylesheet" href="../../css/schedulePage.css" />
</head>
<body>
  <div class="aside">
    <img class="aside__home-btn" src="../../asset/images/house-solid.svg" alt="home"></img>

    <div class="aside__toggle">
      <span class="aside__upper-arrow">ㅡ</span>
      <span class="aside__lower-arrow">ㅡ</span>
    </div>

    <div class="aside__my-info">
      <span>류동호</span> 
      <span>qwer1234</span> 
      <span>010-1111-2222</span>
      <span>경영</span>
    </div>
    <div class="aside__logout-btn">로그아웃</div>
    <div class="aside__move-to-updateMyInfoPage">
      내 정보 수정
    </div>
    <div class="aside__member-list">
      <span>류동호1</span>
      <span>류동호2</span>
      <span>류동호3</span>
      <span>류동호4</span>
      <span>류동호5</span>
      <span>류동호6</span>
      <span>류동호7</span>
      <span>류동호8</span>
      <span>류동호9</span>
      <span>류동호10</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호 last</span>
    </div>
  </div>

  <div id="year" class="year-wrapper">
    <span class="year-wrapper__dercrease-btn">-</span>
    <span class="year-wrapper__num">2024</span>
    <span class="year-wrapper__increase-btn">+</span>
  </div>

  <input id="month" type="button" class="month" value="1" />

  <div class="month-wrapper">
    <input type="button" class="month-wrapper__num" value="1"/>
    <input type="button" class="month-wrapper__num" value="2"/>
    <input type="button" class="month-wrapper__num" value="3"/>
    <input type="button" class="month-wrapper__num" value="4"/>
    <input type="button" class="month-wrapper__num" value="5"/>
    <input type="button" class="month-wrapper__num" value="6"/>
    <input type="button" class="month-wrapper__num" value="7"/>
    <input type="button" class="month-wrapper__num" value="8"/>
    <input type="button" class="month-wrapper__num" value="9"/>
    <input type="button" class="month-wrapper__num" value="10"/>
    <input type="button" class="month-wrapper__num" value="11"/>
    <input type="button" class="month-wrapper__num" value="12"/>
  </div>

  <div class="calendar">
    <div class="calendar__day-of-week-wrapper">
      <div class="calendar__day-of-week">일</div>
      <div class="calendar__day-of-week">월</div>
      <div class="calendar__day-of-week">화</div>
      <div class="calendar__day-of-week">수</div>
      <div class="calendar__day-of-week">목</div>
      <div class="calendar__day-of-week">금</div>
      <div class="calendar__day-of-week">토</div>
    </div>

    <div class="calendar__week-wrapper">
      <div class="calendar__week">
        <div class="calendar__odd-week-day">1</div>
        <div class="calendar__odd-week-day">2</div>
        <div class="calendar__odd-week-day">3 <span class="calendar__schedule-count">3개</span> </div>
        <div class="calendar__odd-week-day">4</div>
        <div class="calendar__odd-week-day">5</div>
        <div class="calendar__odd-week-day">6</div>
        <div class="calendar__odd-week-day">7</div>
      </div>
      <div class="calendar__week">
        <div class="calendar__even-week-day">1</div>
        <div class="calendar__even-week-day">2</div>
        <div class="calendar__even-week-day">3</div>
        <div class="calendar__even-week-day">4</div>
        <div class="calendar__even-week-day">5</div>
        <div class="calendar__even-week-day">6</div>
        <div class="calendar__even-week-day">7</div>
      </div>
      <div class="calendar__week">
        <div class="calendar__odd-week-day">1</div>
        <div class="calendar__odd-week-day">2</div>
        <div class="calendar__odd-week-day">3</div>
        <div class="calendar__odd-week-day">4</div>
        <div class="calendar__odd-week-day">5</div>
        <div class="calendar__odd-week-day">6</div>
        <div class="calendar__odd-week-day">7</div>
      </div>
      <div class="calendar__week">
        <div class="calendar__even-week-day">1</div>
        <div class="calendar__even-week-day">2</div>
        <div class="calendar__even-week-day">3</div>
        <div class="calendar__even-week-day">4</div>
        <div class="calendar__even-week-day">5</div>
        <div class="calendar__even-week-day">6</div>
        <div class="calendar__even-week-day">7</div>
      </div>
      <div class="calendar__week">
        <div class="calendar__odd-week-day">1</div>
        <div class="calendar__odd-week-day">2</div>
        <div class="calendar__odd-week-day">3</div>
        <div class="calendar__odd-week-day">4</div>
        <div class="calendar__odd-week-day">5</div>
        <div class="calendar__odd-week-day">6</div>
        <div class="calendar__odd-week-day">7</div>
      </div>
    </div>
  </div>

  <script src="../../js/schedulePage.js"></script>
  <script src="../../components/js/aside.js"></script>
</body>
