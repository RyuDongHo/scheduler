<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>findPw</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
  <link rel="stylesheet" href="../../css/findPwPage.css">
</head>
<body>
  <form class="find-pw-form" action="../action/findPwAction.jsp" method="post">
    <div class="find-pw-form__banner">FindPw</div>
    <div>
      <span class="find-pw-form__label">아이디</span>
      <input
        type="text"
        id="id"
        class="find-pw-form__text"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="find-pw-form__label">연락처</span>
      <input
        type="text"
        id="hp"
        class="find-pw-form__text"
        placeholder="' - ' 없이 숫자만 입력"
        maxlength="13"
        autocomplete='off'
        required
      />
    </div>
    <input type="submit" class="find-pw-form__btn" value="비밀번호 찾기" />
  </form>

    <script src="../../components/js/inputValidation.js"></script>
    <script src="../../js/findPwPage.js"></script>
</body>
