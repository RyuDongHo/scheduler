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
  <link rel="stylesheet" href="../../components/css/defaultInput.css" />
  <link rel="stylesheet" href="../../css/updateMyInfoPage.css" />
</head>
<body>
  <form class="columnContainer" action="" method="post">
    <div class="inputBanner">내 정보 수정</div>
    <div>
      <span class="inputTitle">아이디</span>
      <input
        type="text"
        id="id"
        class="defaultInputText"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        maxlength="20"
        required
      />
    </div>
    <div>
      <span class="inputTitle">비밀번호</span>
      <input
        type="text"
        id="pw"
        class="defaultInputText"
        placeholder="영어 / 숫자 / 특수문자 를 포함, 6~20글자"
        maxlength="20"
        required
      />
    </div>
    <div>
      <span class="inputTitle">연락처</span>
      <input
        type="text"
        id="hp"
        class="defaultInputText"
        placeholder="010-0000-0000"
        maxlength="13"
        required
      />
    </div>
    <div>
      <span class="inputTitle">이름</span>
      <input
        type="text"
        id="name"
        class="defaultInputText"
        placeholder="영어와 한글만 사용, 6~20글자"
        maxlength="20"
        required
      />
    </div>
    <div class="rowContainer">
      <input
        type="radio"
        class="defaultRadio"
        label="경영"
        name="team"
        required
      />
      <input
        type="radio"
        class="defaultRadio"
        label="디자인"
        name="team"
        required
      />
    </div>
    <input type="submit" class="longBtn" value="수정 완료" />
  </form>
</body>