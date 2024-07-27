inputValidation(
  "id",
  idRegex,
  "영어 와 숫자만 사용, 6~20글자를 입력해주세요.",
  idValidation
);
inputValidation(
  "hp",
  hpRegex,
  "010-xxxx-xxxx 형태로 입력해주세요.",
  hpValidation
);

document.querySelector(".find-pw-form__btn").addEventListener("click", (e) => {
  if (hpValidation.inputLength * idValidation.inputLength == 0) return;
  if (!(hpValidation.validation && idValidation.validation)) {
    e.preventDefault();
    alert("잘못된 입력");
  }
});
