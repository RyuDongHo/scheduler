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
  <link rel="stylesheet" href="../../components/css/defaultInput.css" />
  <link rel="stylesheet" href="../../css/findPwPage.css">
</head>
<body>
  <form class="columnContainer" action="" method="post">
    <div class="banner">FindPw</div>
    <div>
      <span class="label">아이디</span>
      <input
        type="text"
        id="id"
        class="text"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        required
      />
    </div>
    <div>
      <span class="label">연락처</span>
      <input
        type="text"
        id="hp"
        class="text"
        placeholder="010-0000-0000"
        required
      />
    </div>
    <input type="submit" class="longBtn" value="비밀번호 찾기" />
  </form>
</body>
