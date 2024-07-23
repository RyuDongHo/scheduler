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
  <link rel="stylesheet" href="../../css/findIdPage.css">
</head>
<body>
  <form class="columnContainer" action="" method="post">
    <div class="banner">FindId</div>
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
    <input type="submit" class="longBtn" value="아이디 찾기" />
  </form>
</body>
