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
  <link rel="stylesheet" href="../../components/css/aside.css">
  <link rel="stylesheet" href="../../css/schedulePage.css" />
</head>
<body>
  <div class="aside">
    <img id="btn-resetSchedulePage" src="../../asset/images/house-solid.svg" alt="home"></img>

    <div id="btn-toggleAside">
      <span id="upperArrow">ㅡ</span>
      <span id="lowerArrow">ㅡ</span>
    </div>

    <div id="myInfo" class="aside_tab">
      <span>류동호</span> <span>qwer1234</span> <span>010-1111-2222</span>
      <span>경영</span>
    </div>
    <div id="btn-logOut" class="aside_tab">로그아웃</div>
    <div id="btn-moveToUpdateMyInfoPage" class="aside_tab">
      내 정보 수정하기
    </div>
    <div id="memberList" class="aside_tab">
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
      <span>류동호</span>
    </div>
  </div>

  <div id="year">
    <span id="btn-decreaseYear">-</span>
    <span id="yearNum">2024</span>
    <span id="btn-increaseYear">+</span>
  </div>

  <input id="month" type="button" class="btn" value="1" />

  <div id="monthList" class="rowContainer">
    <input type="button" class="monthNum" value="1"/>
    <input type="button" class="monthNum" value="2"/>
    <input type="button" class="monthNum" value="3"/>
    <input type="button" class="monthNum" value="4"/>
    <input type="button" class="monthNum" value="5"/>
    <input type="button" class="monthNum" value="6"/>
    <input type="button" class="monthNum" value="7"/>
    <input type="button" class="monthNum" value="8"/>
    <input type="button" class="monthNum" value="9"/>
    <input type="button" class="monthNum" value="10"/>
    <input type="button" class="monthNum" value="11"/>
    <input type="button" class="monthNum" value="12"/>
  </div>

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

  <script src="../../js/schedulePage.js"></script>
  <script src="../../components/js/aside.js"></script>
</body>
