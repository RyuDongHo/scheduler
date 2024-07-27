<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%
  // 추가 예정
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
        class="update-info-form__text"
        placeholder="영어 와 숫자만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">비밀번호</span>
      <input
        type="password"
        id="pw"
        class="update-info-form__text"
        placeholder="영어 / 숫자 / 특수문자 를 포함, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">연락처</span>
      <input
        type="text"
        id="hp"
        class="update-info-form__text"
        placeholder="' - ' 없이 숫자만 입력"
        maxlength="13"
        autocomplete='off'
        required
      />
    </div>
    <div>
      <span class="update-info-form__label">이름</span>
      <input
        type="text"
        id="name"
        class="update-info-form__text"
        placeholder="영어와 한글만 사용, 6~20글자"
        maxlength="20"
        autocomplete='off'
        required
      />
    </div>
    <div class="update-info-form__radio-wrapper">
      <input
        type="radio"
        class="update-info-form__radio"
        label="경영"
        name="team"
        autocomplete='off'
        required
      />
      <input
        type="radio"
        class="update-info-form__radio"
        label="디자인"
        name="team"
        required
      />
    </div>
    <input type="submit" class="update-info-form__btn" value="수정 완료" />
  </form>

  <script src="../../components/js/inputValidation.js"></script>
  <script src="../../js/updateMyInfoPage.js"></script>
</body>