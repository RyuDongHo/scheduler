let idRegex = /^[a-zA-Z0-9]{4,20}$/;
let pwRegex =
  /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[a-zA-Z\d!@#$%^&*(),.?":{}|<>]{6,20}$/;
let hpRegex = /^010-\d{4}-\d{4}/;
let nameRegex = /^[가-힣a-zA-Z]{2,20}$/;

let idValidation = {inputLength: 0, validation: false};
let pwValidation = {inputLength: 0, validation: false};
let hpValidation = {inputLength: 0, validation: false};
let nameValidation = {inputLength: 0, validation: false};
let teamValidation = {inputLength: 0, validation: false};

function inputValidation(inputTagId, regex, msg, validationObj) {
  let errMsg = document.createElement("div");
  let inputTag = document.getElementById(inputTagId);
  errMsg.style.color = "red";
  errMsg.style.fontSize = "12px";
  errMsg.setAttribute("id", "errMsg" + inputTagId);
  document.getElementById(inputTagId).parentElement.appendChild(errMsg);

  inputTag.addEventListener("input", () => {
    if (regex == hpRegex) {
      inputTag.value = inputTag.value
        .replace(/[^0-9]/g, "")
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,6})$/g, "$1-$2-$3")
        .replace(/(\-{1,2})$/g, "");
    }
    if (regex.test(inputTag.value)) {
      document.getElementById("errMsg" + inputTagId).innerHTML = "";
      validationObj.validation = true;
    } else {
      document.getElementById("errMsg" + inputTagId).innerHTML = msg;
      validationObj.validation = false;
    }
    validationObj.inputLength = inputTag.value.length;
  });
}
function radioValidation(radioTagName, validationObj, oldClassName, newClassName) {
  let radio = document.getElementsByName(radioTagName);

  for (let i = 0; i < radio.length; ++i) {
    radio[i].addEventListener("click", () => {
      validationObj.validation = true;
      validationObj.inputLength = 1;
      for (let j = 0; j < radio.length; ++j) {
        if (radio[j].checked) {
          radio[j].className = newClassName;
        } else {
          radio[j].className = oldClassName;
        }
      }
    });
  }
}

// 의존성이 너무 높음, id를 변경할 수 없고, 이 코드자체도 수정했을 때 결과를 알 수 없음
// 함수만 따로 만들어 주는 게 맞다
