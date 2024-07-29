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


  String getMyInfoSql = "SELECT u.id, u.password, u.phoneNumber, u.name FROM user as u\n"
                      + "join team as t on t.idx = u.teamIdx WHERE u.idx = ?";
  PreparedStatement getMyInfoQuery = connect.prepareStatement(getMyInfoSql);
  getMyInfoQuery.setInt(1, userIdx);
  ResultSet myInfo = getMyInfoQuery.executeQuery();
  myInfo.next();
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>UpdateMyInfo</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
  <link rel="stylesheet" href="../../css/updateMyInfoPage.css" />
</head>
<body>
  <form class="update-info-form" action="../action/updateMyInfoAction.jsp" method="post">
    <div class="update-info-form__banner">내 정보 수정</div>
    <div>
      <span class="update-info-form__label">아이디</span>
      <input
        type="text"
        id="id"
        name="id"
        class="update-info-form__text"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        value='<%=myInfo.getString(1)%>'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">비밀번호</span>
      <input
        type="password"
        id="pw"
        name="pw"
        class="update-info-form__text"
        placeholder="영어 / 숫자 / 특수문자 를 포함, 6~20글자"
        maxlength="20"
        autocomplete='off'
        value='<%=myInfo.getString(2)%>'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">비밀번호 재확인</span>
      <input
        type="password"
        id="pw-check"
        name="pw-check"
        class="update-info-form__text"
        placeholder="영어 / 숫자 / 특수문자 를 포함, 6~20글자"
        maxlength="20"
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">연락처</span>
      <input
        type="text"
        id="hp"
        name="hp"
        class="update-info-form__text"
        placeholder="' - ' 없이 숫자만 입력"
        maxlength="13"
        autocomplete='off'
        value='<%=myInfo.getString(3)%>'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">이름</span>
      <input
        type="text"
        id="name"
        name="name"
        class="update-info-form__text"
        placeholder="영어와 한글만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        value='<%=myInfo.getString(4)%>'
        required
      />
    </div>
    <div class="update-info-form__radio-wrapper">
      <input
        type="radio"
        class="update-info-form__radio"
        label="경영"
        name="team"
        value="1"
        required
      />
      <input
        type="radio"
        class="update-info-form__radio"
        label="디자인"
        name="team"
        value="2"
        required
      />
    </div>
    <input type="submit" class="update-info-form__btn" value="수정 완료" />
  </form>

  <script src="../../components/js/inputValidation.js"></script>
  <script src="../../js/updateMyInfoPage.js"></script>
</body>