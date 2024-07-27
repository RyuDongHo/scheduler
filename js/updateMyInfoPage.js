
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
radioValidation("team", teamValidation, "update-info-form__radio", "update-info-form__radio--selected");

document.querySelector(".update-info-form__btn").addEventListener("click", (e) => {
  if((idValidation.inputLength * pwValidation.inputLength * hpValidation.inputLength * nameValidation.inputLength * teamValidation.inputLength) == 0) return;
  if (!(idValidation.validation && pwValidation.validation && hpValidation.validation && nameValidation.validation && teamValidation.validation)) {
    e.preventDefault();
    alert("잘못된 입력");
  }
});
