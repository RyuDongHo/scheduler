<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  Integer userIdx = (Integer)session.getAttribute("userIdx"); // 현재 로그인한 유저
  if(userIdx == null){
    response.sendRedirect("./loginPage.jsp");
    return;
  }
  Integer currentUserIdx = Integer.parseInt(request.getParameter("userIdx")); // 스케줄을 확인할 유저
  if(currentUserIdx == null){
    currentUserIdx = userIdx;
  }
  String year = request.getParameter("year");
  String month = request.getParameter("month");
  String day = request.getParameter("day");

  // 현재 시간 가져오기
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  Date currentDate = new Date();
  String currentTime = sdf.format(currentDate);

  // DB연결
  Class.forName("org.mariadb.jdbc.Driver");
  Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/schedule", "stageus", "1234");

  String sql = "SELECT `startTime`, `endTime`, `content`, `idx` FROM schedule WHERE `userIdx`=? and `startTime` >= ? and `endTime` <= ?"
              +"ORDER BY `startTime` ASC";
  PreparedStatement query = connect.prepareStatement(sql);
  query.setInt(1, currentUserIdx);
  query.setString(2, year + "-" + month + "-" + day + " 00:00:00");
  query.setString(3, year + "-" + month + "-" + day + " 23:59:59");
  ResultSet result = query.executeQuery();
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
  <section class="date">
    <div class="date__year">
      <%=year%>
    </div>
    <div class="date__month">
      <%=month%>월
    </div>
    <div class="date__day">
      <%=day%>일
    </div>
  </section>

<%
  while(result.next()){
    String startTime = result.getString(1).split(" ")[1].split(":")[0] + ":" + result.getString(1).split(" ")[1].split(":")[1];
    String endTime = result.getString(2).split(" ")[1].split(":")[0] + ":" + result.getString(2).split(" ")[1].split(":")[1];
    String content = result.getString(3);
    int scheduleIdx = result.getInt(4);
    Date end = sdf.parse(result.getString(2));
    
    if(currentDate.before(end)){
    // 진행중인 일정
%>
      <form action="../action/updateScheduleAction.jsp" method="post" class="schedule-wrapper">
        <div class="schedule-wrapper__schedule">
          <div class="schedule__time-wrapper">
            <div class="schedule__start-time"><%=startTime%></div>
            <span>-</span>
            <div class="schedule__end-time"><%=endTime%></div>
          </div>

          <div class="schedule__time-input-wrapper no-display">
            <input class="schedule__start-time-input" name="start-time" maxlength="5" type="text" placeholder="HH:MM">
            <span>-</span>
            <input class="schedule__end-time-input" name="end-time" maxlength="5" type="text" placeholder="HH:MM">
          </div>

          <div class="schedule__content"><%=content%></div>

          <input class="schedule__content-input no-display" name="content" type="text">
        </div>
<%  
        if(userIdx == currentUserIdx){
%>  
          <input type="button" class="schedule-wrapper__modify-btn" value="수정">
          <input type="button" class="schedule-wrapper__delete-btn" data-schedule-idx="<%=scheduleIdx%>" 
                                                                    data-current-user-idx="<%=currentUserIdx%>" 
                                                                    value="삭제">
          <input type="submit" class="schedule-wrapper__apply-btn no-display" value="등록">
          <input type="button" class="schedule-wrapper__cancel-btn no-display" value="취소">
          <input type="hidden" name="scheduleIdx" value="<%=scheduleIdx%>">
          <input type="hidden" name="userIdx" value="<%=currentUserIdx%>">
          <input type="hidden" name="year" value="<%=year%>">
          <input type="hidden" name="month" value="<%=month%>">
          <input type="hidden" name="day" value="<%=day%>">
<%  
        }
%>  
      </form>
<%
    }
    else if(currentDate.after(end)){
    // 만료된 일정
%>
      <form action="" method="post" class="schedule-wrapper">
        <div class="schedule-wrapper__schedule--passed">
          <div class="schedule__time-wrapper">
            <div class="schedule__start-time--passed"><%=startTime%></div>
            <span>-</span>
            <div class="schedule__end-time--passed"><%=endTime%></div>
          </div>
          <div class="schedule__content--passed"><%=content%></div>
        </div>
<%  
        if(userIdx == currentUserIdx){
%>  
          <input type="button" class="schedule-wrapper__modify-btn--passed" value="수정">
          <input type="button" class="schedule-wrapper__delete-btn--passed" value="삭제">
<%  
        }
%>  
      </form>
<%
    }
  }
%>


<%
  if(userIdx == currentUserIdx){
  // 로그인한 사용자가 본인의 일정을 보고 있는 경우
  // 새 일정을 등록할 수 있는 input
%>

  <form action="../action/insertScheduleAction.jsp" method="post" class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <div class="schedule__time-input-wrapper">
        <input class="schedule__start-time-input" name="start-time" maxlength="5" type="text" placeholder="HH:MM">
        <span>-</span>
        <input class="schedule__end-time-input" name="end-time" maxlength="5" type="text" placeholder="HH:MM">
      </div>
      <input class="schedule__content-input" name="content" type="text" placeholder="일정을 입력하세요.">
    </div>
    <input type="submit" class="schedule-wrapper__apply-btn" value="등록">

    <input type="hidden" name="year" value="<%=year%>">
    <input type="hidden" name="month" value="<%=month%>">
    <input type="hidden" name="day" value="<%=day%>">
  </form>

<%
  }
%>

  <script src="../../js/selectedSchedulePage.js"></script>
</body>