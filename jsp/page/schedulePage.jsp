<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%

  Integer userIdx = (Integer)session.getAttribute("userIdx"); // 현재 로그인한 유저
  if(userIdx == null){
    response.sendRedirect("./loginPage.jsp");
    return;
  }

  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234"); // db연결

  int currentUserIdx = userIdx; // 스케줄을 확인할 유저(default: 로그인한 유저)
  if(request.getParameter("userIdx") != null){
    currentUserIdx = Integer.parseInt(request.getParameter("userIdx"));
  }
  String input_year = request.getParameter("year"); // 전달된 연도
  String input_month = request.getParameter("month"); // 전달된 월

  // 달력 설정
  Calendar cal = Calendar.getInstance();
  int year = cal.get(Calendar.YEAR);
  int month = cal.get(Calendar.MONTH) + 1;
  int day = cal.get(Calendar.DATE);
  int startDay = cal.get(Calendar.DAY_OF_WEEK);
  int lastDate = cal.getActualMaximum(Calendar.DATE);

  cal.set(year, month - 1, 1);
  startDay = cal.get(Calendar.DAY_OF_WEEK);
  if(input_year != null && input_month != null){
    year = Integer.parseInt(input_year);
    month = Integer.parseInt(input_month);
  }
  
  String sql = "SELECT `date`, COUNT(content) FROM schedule WHERE `userIdx`=? and `date` >= ? and `date` <= ? group by `date`";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, userIdx);
  query.setString(2, year + "-" + month + "-" + "01");
  query.setString(3, year + "-" + month + "-" + lastDate);
  ResultSet schedule = query.executeQuery();
  int isScheduleExist = 0;
  if(schedule.next()) isScheduleExist = 1;

  String leaderCheckSql = "SELECT IFNULL((SELECT `userIdx` FROM leader WHERE `userIdx`=?), 0)";
  PreparedStatement leaderCheckQuery = connect.prepareStatement(leaderCheckSql);
  leaderCheckQuery.setInt(1, userIdx);
  ResultSet isLeader = leaderCheckQuery.executeQuery();
  isLeader.next();

%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Schedule</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
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
      <span>qwer1234</span> 
      <span>010-1111-2222</span>
      <span>경영</span>
    </div>
    <div class="aside__logout-btn">로그아웃</div>
    <div class="aside__move-to-updateMyInfoPage">
      내 정보 수정
    </div>
    <div class="aside__member-list">
    <%
      for(int i = 2; i < 12; ++i){
        if(currentUserIdx != userIdx){
          if(i == currentUserIdx){
            %>
              <input class='aside__member--selected' type='button' idx='<%=i%>' value="류동호"></input>
            <%
          } else{
            %>
              <input class='aside__member' type='button' idx='<%=i%>' value="류동호"></input>
            <%
          }
        } else{
            %>
              <input class='aside__member' type='button' idx='<%=i%>' value="류동호"></input>
            <%
        }
      }
    %>
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
            %>
              <div class='calendar__day hide'></div>
            <%
          }

          for (int i = 1; i <= lastDate; i++) {
            if(startDay % 2 == 0){
              if(i % 2 == 1) {
                %>
                  <div class='calendar__day background-transparent' day="<%=i%>"><%=i%>
                    <p class="calendar__schedule-count">
                <%
                    if(isScheduleExist == 1 && schedule.getInt(2) > 0 && 
                      Integer.parseInt(schedule.getString(1).split("-")[2]) == i){
                      %>
                        <%=schedule.getInt(2)%>
                      <%
                      if(!schedule.next()) isScheduleExist = 0;
                    }
                %>  
                    </p>
                  </div>
                <%
              }
              else {
                %>
                  <div class='calendar__day background-white' day="<%=i%>"><%=i%>
                    <p class="calendar__schedule-count">
                <%
                    if(isScheduleExist == 1 && schedule.getInt(2) > 0 && 
                      Integer.parseInt(schedule.getString(1).split("-")[2]) == i){
                      %>
                        <%=schedule.getInt(2)%>
                      <%
                      if(!schedule.next()) isScheduleExist = 0;
                    }
                %>  
                    </p>
                  </div>
                <%
              }
            }
            else{
              if(i % 2 == 1) {
                %>
                  <div class='calendar__day background-white' day="<%=i%>"><%=i%>
                    <p class="calendar__schedule-count">
                <%
                    if(isScheduleExist == 1 && schedule.getInt(2) > 0 && 
                      Integer.parseInt(schedule.getString(1).split("-")[2]) == i){
                      %>
                        <%=schedule.getInt(2)%>
                      <%
                      if(!schedule.next()) isScheduleExist = 0;
                    }
                %>  
                    </p>
                  </div>
                <%
              }
              else {
                %>
                  <div class='calendar__day background-transparent' day="<%=i%>"><%=i%>
                    <p class="calendar__schedule-count">
                <%
                    if(isScheduleExist == 1 && schedule.getInt(2) > 0 && 
                      Integer.parseInt(schedule.getString(1).split("-")[2]) == i){
                      %>
                        <%=schedule.getInt(2)%>
                      <%
                      if(!schedule.next()) isScheduleExist = 0;
                    }
                %>  
                    </p>
                  </div>
                <%
              }
            }
            
          }
        %>
  </main>

  <script>let isLeader = <%=isLeader.getInt(1)%>; let currentUserIdx = <%=currentUserIdx%>;</script>
  <script src="../../js/schedulePage.js"></script>
  
</body>
