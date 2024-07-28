<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="../../components/css/global.css" />
    <link rel="stylesheet" href="../../components/css/theme.css" />
    <link rel="stylesheet" href="../../css/loginPage.css" />
</head>
<body>
  <form class="login-form" action="../action/loginAction.jsp" method="post">
    <div class="login-form__banner">Login</div>
    <div>
      <span class="login-form__label">아이디</span>
      <input
        type="text"
        id="id"
        name="id"
        class="login-form__text"
        placeholder="아이디"
        maxlength="20"
        required
      />
    </div>
    <div>
      <span class="login-form__label">비밀번호</span>
      <input
        type="password"
        id="pw"
        name="pw"
        class="login-form__text"
        placeholder="비밀번호"
        maxlength="20"
        required
      />
    </div>

    <div class="btn-wrapper">
      <input id="findId" type="button" class="btn-wrapper__find-id" value="아이디 찾기" />
      <input
        id="findPw"
        type="button"
        class="btn-wrapper__find-pw"
        value="비밀번호 찾기"
      />
      <input id="signUp" type="button" class="btn-wrapper__sign-up" value="회원가입" />
      <input id="login" type="submit" class="btn-wrapper__login" value="로그인" />
    </div>
  </form>

  <script src="../../js/loginPage.js"></script>
</body>