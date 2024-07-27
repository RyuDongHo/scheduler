let modifyBtn = document.querySelectorAll(".schedule-wrapper__modify-btn");
let deleteBtn = document.querySelectorAll(".schedule-wrapper__delete-btn");
let applyBtn = document.querySelectorAll(".schedule-wrapper__apply-btn");
let cancelBtn = document.querySelectorAll(".schedule-wrapper__cancel-btn");
let time = document.querySelectorAll(".schedule__time");
let timeInput = document.querySelectorAll(".schedule__time-input");
let content = document.querySelectorAll(".schedule__content");
let contentInput = document.querySelectorAll(".schedule__content-input");

for (let i = 0; i < modifyBtn.length; ++i) {
    modifyBtn[i].addEventListener("click", () => {
    timeInput[i].setAttribute("type", "input");
    contentInput[i].setAttribute("type", "input");
    time[i].style.display = "none";
    content[i].style.display = "none";
    modifyBtn[i].setAttribute("type", "hidden");
    deleteBtn[i].setAttribute("type", "hidden");
    applyBtn[i].setAttribute("type", "button");
    cancelBtn[i].setAttribute("type", "button");
  });

  cancelBtn[i].addEventListener("click", () => {
    timeInput[i].setAttribute("type", "hidden");
    contentInput[i].setAttribute("type", "hidden");
    time[i].style.display = "block";
    content[i].style.display = "block";
    modifyBtn[i].setAttribute("type", "button");
    deleteBtn[i].setAttribute("type", "button");
    applyBtn[i].setAttribute("type", "hidden");
    cancelBtn[i].setAttribute("type", "hidden");
  });

  timeInput[i].addEventListener("input", () => {
    timeInput[i].value = timeInput[i].value
      .replace(/[^0-9]/g, "")
      .replace(/^(\d{0,2})(\d{0,2})(\d{0,2})(\d{0,2})$/g, "$1:$2-$3:$4")
      .replace(/(\:{1,2})$/g, "")
      .replace(/(\-{1,2})$/g, "")
      .replace(/(\:{1,2})$/g, "")
      .replace(/(\-{1,2})$/g, "");
  });

  applyBtn[i].addEventListener("click", () => {
    if(timeInput[i].value.length < 11) {
      alert("시간/분 을 정확히 다 입력해주세요(ex: 10:07-11:28)");
      return;
    }

    let startHour = timeInput[i].value.split("-")[0].split(":")[0];
    let startMinute = timeInput[i].value.split("-")[0].split(":")[1];
    let endHour = timeInput[i].value.split("-")[1].split(":")[0];
    let endMinute = timeInput[i].value.split("-")[1].split(":")[1];
    if(startHour >= 24 || endHour >= 24 || startMinute >= 60 || endMinute >= 60){
      alert("00:00 ~ 23:59 안에서 입력 가능합니다.");
    }
    else if(startHour > endHour || (startHour == endHour && startMinute > endMinute)){
      alert("시작시간이 종료시간 보다 클 수 없습니다.");
    }
    else if(contentInput[i].value.length == 0){
      alert("일정을 입력하세요.")
    }
    else{
      time[i].innerText = timeInput[i].value;
      content[i].innerText = contentInput[i].value;

      timeInput[i].setAttribute("type", "hidden");
      contentInput[i].setAttribute("type", "hidden");
      time[i].style.display = "block";
      content[i].style.display = "block";
      modifyBtn[i].setAttribute("type", "button");
      deleteBtn[i].setAttribute("type", "button");
      applyBtn[i].setAttribute("type", "hidden");
      cancelBtn[i].setAttribute("type", "hidden");
    }
  });

  // deleteBtn[i].addEventListener("click", () => {
  //   deleteBtn[i].parentElement.childNodes[1].style.boxShadow = "0 4px 8px var(--color-gray)";
  //   modifyBtn[i].style.boxShadow = "0 0 0 0";
  //   modifyBtn[i].style.backgroundColor = "var(--color-gray)";
  //   modifyBtn[i].style.pointerEvents = "none";
  //   deleteBtn[i].style.boxShadow = "0 0 0 0";
  //   deleteBtn[i].style.backgroundColor = "var(--color-gray)";
  //   content[i].style.textDecoration = "line-through";

  // })
}
