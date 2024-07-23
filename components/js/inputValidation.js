let id;
let pw;
let hp;
let _name;
let team;

let idRegex = /^[a-zA-Z0-9]{4,20}$/;
let pwRegex =
  /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[a-zA-Z\d!@#$%^&*(),.?":{}|<>]{6,20}$/;
let hpRegex = "";
let nameRegex = /^[가-힣a-zA-Z]{2,20}$/;

let errMsg = document.createElement("div");
errMsg.style.color = "red";
errMsg.style.fontSize = "12px";

if (document.getElementById("id") != null) {
  id = document.getElementById("id");
  let errMsg = document.createElement("div");
  errMsg.style.color = "red";
  errMsg.style.fontSize = "12px";
  errMsg.setAttribute("id", "idErrMsg");
  id.parentElement.appendChild(errMsg);
}
if (document.getElementById("pw") != null) {
  pw = document.getElementById("pw");
  let errMsg = document.createElement("div");
  errMsg.style.color = "red";
  errMsg.style.fontSize = "12px";
  errMsg.setAttribute("id", "pwErrMsg");
  pw.parentElement.appendChild(errMsg);
}
if (document.getElementById("hp") != null) {
  hp = document.getElementById("hp");
  let errMsg = document.createElement("div");
  errMsg.style.color = "red";
  errMsg.style.fontSize = "12px";
  errMsg.setAttribute("id", "hpErrMsg");
  hp.parentElement.appendChild(errMsg);
}
if (document.getElementById("name") != null) {
  _name = document.getElementById("name");
  let errMsg = document.createElement("div");
  errMsg.style.color = "red";
  errMsg.style.fontSize = "12px";
  errMsg.setAttribute("id", "nameErrMsg");
  _name.parentElement.appendChild(errMsg);
}
if (document.getElementsByName("team") != null) {
  team = document.getElementsByName("team");
}

id.addEventListener("input", idValidation);
pw.addEventListener("input", pwValidation);
hp.addEventListener("input", hpValidation);
_name.addEventListener("input", nameValidation);

team.forEach((node) => {
  node.addEventListener("click", ()=>{
    team.forEach((node)=>{
      if(node.checked) node.style.backgroundColor = "var(--color-mint)";
      else node.style.backgroundColor = "var(--color-white)";
    })
  })
});

function idValidation() {
  if (idRegex.test(id.value)) {
    document.getElementById("idErrMsg").innerHTML = "";
  } else {
    document.getElementById("idErrMsg").innerHTML =
      "영어 대소문자, 숫자를 사용한 4~20글자 로 설정해 주세요.";
  }
}

function pwValidation() {
  if (pwRegex.test(pw.value)) {
    document.getElementById("pwErrMsg").innerHTML = "";
  } else {
    document.getElementById("pwErrMsg").innerHTML =
      "영어 대소문자, 숫자, 특수문자 를 각 최소 1개 이상 포함하여 6~20글자로 설정해주세요";
  }
}

function hpValidation() {
  hp.value = hp.value
    .replace(/[^0-9]/g, "")
    .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}

function nameValidation() {
  if (nameRegex.test(_name.value)) {
    document.getElementById("nameErrMsg").innerHTML = "";
  } else {
    document.getElementById("nameErrMsg").innerHTML =
      "영문과 한글만 사용가능하여 2글자 이상 입력해주세요.";
  }
}