<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  int userIdx = 1; // 지금 로그인한 유저
  int currentUserIdx = Integer.parseInt(request.getParameter("userIdx")); // 스케줄을 확인할 유저
  String year = request.getParameter("year");
  String month = request.getParameter("month");
  String day = request.getParameter("day");

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
  <form action="" method="post" class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <div class="schedule__time">09:00-12:00</div>
      <input class="schedule__time-input" maxlength="11" type="hidden">
      <div class="schedule__content">일정 입니다.</div>
      <input class="schedule__content-input" type="hidden">
    </div>
    <input type="button" class="schedule-wrapper__modify-btn" value="수정">
    <input type="button" class="schedule-wrapper__delete-btn" value="삭제">

    <input type="hidden" class="schedule-wrapper__apply-btn" value="등록">
    <input type="hidden" class="schedule-wrapper__cancel-btn" value="취소">
  </form>

  <form action="" method="post" class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <div class="schedule__time">09:00-12:00</div>
      <input class="schedule__time-input" maxlength="11" type="hidden">
      <div class="schedule__content">일정 입니다. 1</div>
      <input class="schedule__content-input" type="hidden">
    </div>
    <input type="button" class="schedule-wrapper__modify-btn" value="수정">
    <input type="button" class="schedule-wrapper__delete-btn" value="삭제">

    <input type="hidden" class="schedule-wrapper__apply-btn" value="등록">
    <input type="hidden" class="schedule-wrapper__cancel-btn" value="취소">
  </form>

  <form action="" method="post" class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <div class="schedule__time">12:00-14:00</div>
      <input class="schedule__time-input" maxlength="11" type="hidden">
      <div class="schedule__content">일정 입니다. 2</div>
      <input class="schedule__content-input" type="hidden">
    </div>
    <input type="button" class="schedule-wrapper__modify-btn" value="수정">
    <input type="button" class="schedule-wrapper__delete-btn" value="삭제">

    <input type="hidden" class="schedule-wrapper__apply-btn" value="등록">
    <input type="hidden" class="schedule-wrapper__cancel-btn" value="취소">
  </form>

  <form action="" method="post" class="schedule-wrapper">
    <div class="schedule-wrapper__schedule">
      <input class="schedule__time-input" maxlength="11" type="text">
      <input class="schedule__content-input" type="text">
    </div>
    <input type="hidden" class="schedule-wrapper__modify-btn" value="수정">
    <input type="hidden" class="schedule-wrapper__delete-btn" value="삭제">

    <input type="button" class="schedule-wrapper__apply-btn" value="등록">
    <input type="hidden" class="schedule-wrapper__cancel-btn" value="취소">
  </form>


  <script src="../../js/selectedSchedulePage.js"></script>
</body>