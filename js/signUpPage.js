inputValidation(
  "id",
  idRegex,
  "영어 와 숫자만 사용, 6~20글자를 입력해주세요.",
  idValidation
);
inputValidation(
  "pw",
  pwRegex,
  "영어 / 숫자 / 특수문자 를 포함, 6~20글자를 입력해주세요.",
  pwValidation
);
inputValidation(
  "hp",
  hpRegex,
  "010-xxxx-xxxx 형태로 입력해주세요.",
  hpValidation
);
inputValidation(
  "name",
  nameRegex,
  "영어와 한글만 사용, 2~20글자를 입력해주세요.",
  nameValidation
);
passwordCheckValidation("pw", "pw-check", pwCheckValidation);
radioValidation(
  "team",
  teamValidation,
  "sign-up-form__radio",
  "sign-up-form__radio--selected"
);
window.addEventListener("pageshow", () => {
  let team = document.getElementsByName("team");
  for (let i = 0; i < team.length; ++i) {
    if (team[i].checked) team[i].className = "sign-up-form__radio--selected";
  }
});

document.querySelector(".sign-up-form__btn").addEventListener("click", (e) => {
  if (
    idValidation.inputLength == 0 ||
    pwValidation.inputLength == 0 ||
    pwCheckValidation.inputLength == 0 ||
    hpValidation.inputLength == 0 ||
    nameValidation.inputLength == 0 ||
    teamValidation.inputLength == 0
  ) {
    return;
  }
  if (
    !(
      idValidation.validation &&
      pwValidation.validation &&
      pwCheckValidation.validation &&
      hpValidation.validation &&
      nameValidation.validation &&
      teamValidation.validation
    )
  ) {
    e.preventDefault();
    alert("잘못된 입력");
  }
});
