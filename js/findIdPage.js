inputValidation(
  "hp",
  hpRegex,
  "010-xxxx-xxxx 형태로 입력해주세요.",
  hpValidation
);

document.querySelector(".find-id-form__btn").addEventListener("click", (e) => {
  if(hpValidation.inputLength == 0) return;
  if (!hpValidation.validation) {
    e.preventDefault();
    alert("잘못된 입력");
  }
});
