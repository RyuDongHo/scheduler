<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%
  String userIdx = request.getParameter("userIdx");
  String input_year = request.getParameter("year");
  String input_month = request.getParameter("month");

  Calendar cal = Calendar.getInstance();
  Calendar tCal = Calendar.getInstance();

  int year = cal.get(Calendar.YEAR);
  int month = cal.get(Calendar.MONTH) + 1;
  int day = cal.get(Calendar.DATE);
  int startDay = cal.get(Calendar.DAY_OF_WEEK);
  int lastDate = cal.getActualMaximum(Calendar.DATE);

  if(input_year != null && input_month != null){
    year = Integer.parseInt(input_year);
    month = Integer.parseInt(input_month);
  }
  
  cal.set(year, month - 1, 1);
  startDay = cal.get(Calendar.DAY_OF_WEEK);

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

  <aside>
    <img class="aside__home-btn" src="../../asset/images/house-solid.svg" alt="home"></img>

    <div class="aside__toggle">
      <span class="aside__upper-arrow">ㅡ</span>
      <span class="aside__lower-arrow">ㅡ</span>
    </div>

    <div class="aside__my-info">
      <span>류동호</span> 
      <%-- 글씨는 h1 h2 p... --%>
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
  </aside>

  <section id="year" class="year-wrapper">
    <input type="button" class="year-wrapper__dercrease-btn" value="-"></input>
    <h3 class="year-wrapper__num"><%=year%></h3>
    <input type="button" class="year-wrapper__increase-btn" value="+"></input>
  </section>

  <input id="month" type="button" class="month" value="<%=month%>" />

  <section class="month-wrapper">
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
  </section>

  <main class="calendar">
        <div class="calendar__day-of-week">일</div>
        <div class="calendar__day-of-week">월</div>
        <div class="calendar__day-of-week">화</div>
        <div class="calendar__day-of-week">수</div>
        <div class="calendar__day-of-week">목</div>
        <div class="calendar__day-of-week">금</div>
        <div class="calendar__day-of-week">토</div>
        <%
          for (int i = 1; i < startDay; i++) {
            out.println("<div class='calendar__day'>&nbsp;</div>");
          }
          for (int i = 1; i <= lastDate; i++) {
            // 일요일 찾기
           
            if(startDay % 2 == 0){
              if(i % 2 == 1) out.println("<div class='calendar__day background-transparent'>" + i + "</div>");
              else out.println("<div class='calendar__day background-white'>" + i + "</div>");
            }
            else{
              if(i % 2 == 1) out.println("<div class='calendar__day background-white'>" + i + "</div>");
              else out.println("<div class='calendar__day background-transparent'>" + i + "</div>");
            }
            
          }
        %>
  </main>

  <script src="../../js/schedulePage.js"></script>
  <script src="../../components/js/aside.js"></script>
</body>
