<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>signUp</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
  <link rel="stylesheet" href="../../css/signUpPage.css" />
</head>
<body>
  <form class="sign-up-form" action="../action/signUpAction.jsp" method="post">
    <div class="sign-up-form__banner">회원가입</div>
    <div>
      <span class="sign-up-form__label">아이디</span>
      <input
        type="text"
        id="id"
        class="sign-up-form__text"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="sign-up-form__label">비밀번호</span>
      <input
        type="password"
        id="pw"
        class="sign-up-form__text"
        placeholder="영어 / 숫자 / 특수문자 를 포함, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="sign-up-form__label">연락처</span>
      <input
        type="text"
        id="hp"
        class="sign-up-form__text"
        placeholder="' - ' 없이 숫자만 입력"
        maxlength="13"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="sign-up-form__label">이름</span>
      <input
        type="text"
        id="name"
        class="sign-up-form__text"
        placeholder="영어와 한글만 사용, 6~20글자"
        maxlength="20"
        required
      />
    </div>
    <div class="sign-up-form__radio-wrapper">
      <input
        type="radio"
        class="sign-up-form__radio"
        label="경영"
        name="team"
        required
      />
      <input
        type="radio"
        class="sign-up-form__radio"
        label="디자인"
        name="team"
        required
      />
    </div>
    <input type="submit" class="sign-up-form__btn" value="회원 가입 완료" />
  </form>

  <script src="../../components/js/inputValidation.js"></script>
  <script src="../../js/signUpPage.js"></script>
</body>