<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
%>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>findId</title>
  <link rel="stylesheet" href="../../components/css/global.css" />
  <link rel="stylesheet" href="../../components/css/theme.css" />
  <link rel="stylesheet" href="../../css/findIdPage.css">
</head>
<body>
  <form class="find-id-form" action="../action/findIdAction.jsp" method="post">
    <div class="find-id-form__banner">FindId</div>
    <div>
      <span class="find-id-form__label">연락처</span>
      <input
        type="text"
        id="hp"
        name="hp"
        class="find-id-form__text"
        placeholder="' - ' 없이 숫자만 입력"
        maxlength="13"
        required
      />
    </div>
    <input type="submit" class="find-id-form__btn" value="아이디 찾기"/>
  </form>

  <script src="../../components/js/inputValidation.js"></script>
  <script src="../../js/findIdPage.js"></script>
</body>
