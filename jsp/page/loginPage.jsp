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
    <link rel="stylesheet" href="../../css/loginPage.css" />
  </head>
  <body>
    <form class="columnContainer" action="" method="post">
      <div class="inputBanner">Login</div>
      <div>
        <span class="inputTitle">아이디</span>
        <input
          type="text"
          id="id"
          class="defaultText"
          placeholder="아이디"
          required
        />
      </div>
      <div>
        <span class="inputTitle">비밀번호</span>
        <input
          type="text"
          id="pw"
          class="defaultText"
          placeholder="비밀번호"
          required
        />
      </div>
    </form>

    <div class="rowContainer">
      <input id="findId" type="button" class="defaultBtn" value="아이디 찾기" />
      <input
        id="findPw"
        type="button"
        class="defaultBtn"
        value="비밀번호 찾기"
      />
      <input id="signUp" type="button" class="defaultBtn" value="회원가입" />
      <input id="login" type="button" class="defaultBtn" value="로그인" />
    </div>
  </body>
