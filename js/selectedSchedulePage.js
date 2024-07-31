// Btn
const modifyBtn = document.querySelectorAll(".schedule-wrapper__modify-btn");
const deleteBtn = document.querySelectorAll(".schedule-wrapper__delete-btn");
const applyBtn = document.querySelectorAll(".schedule-wrapper__apply-btn");
const cancelBtn = document.querySelectorAll(".schedule-wrapper__cancel-btn");
// input
const startTimeInput = document.querySelectorAll(".schedule__start-time-input");
const endTimeInput = document.querySelectorAll(".schedule__end-time-input");
const contentInput = document.querySelectorAll(".schedule__content-input");

// modifyBtn
for (let i = 0; i < modifyBtn.length; ++i) {
  modifyBtn[i].addEventListener("click", () => {
    const shcheduleWrapper = modifyBtn[i].parentElement;
    modifyBtn[i].classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule__time-wrapper").classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule__content").classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule__content-input").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule__time-input-wrapper").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__cancel-btn").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__apply-btn").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__delete-btn").classList.add("no-display");
  });
}
// cancelBtn
for (let i = 0; i < cancelBtn.length; ++i) {
  cancelBtn[i].addEventListener("click", () => {
    const shcheduleWrapper = cancelBtn[i].parentElement;
    cancelBtn[i].classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule__time-wrapper").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule__content").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule__content-input").classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule__time-input-wrapper").classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__modify-btn").classList.remove("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__apply-btn").classList.add("no-display");
    shcheduleWrapper.querySelector(".schedule-wrapper__delete-btn").classList.remove("no-display");
  });
}
// deletBtn
for(let i = 0; i < deleteBtn.length; ++i){
  deleteBtn[i].addEventListener("click", ()=>{
    location.href = "../action/deleteScheduleAction.jsp?idx=" + deleteBtn[i].getAttribute("idx");
  })
}
// input & applyBtn
for (let i = 0; i < startTimeInput.length; ++i) {
  startTimeInput[i].addEventListener("input", () => {
    startTimeInput[i].value = startTimeInput[i].value
      .replace(/[^0-9]/g, "")
      .replace(/^(\d{0,2})(\d{0,2})$/g, "$1:$2")
      .replace(/(\:{1,2})$/g, "");
  });
  endTimeInput[i].addEventListener("input", () => {
    endTimeInput[i].value = endTimeInput[i].value
      .replace(/[^0-9]/g, "")
      .replace(/^(\d{0,2})(\d{0,2})$/g, "$1:$2")
      .replace(/(\:{1,2})$/g, "");
  });
  applyBtn[i].addEventListener("click", (event) => {
    if (
      startTimeInput[i].value.length < 5 ||
      endTimeInput[i].value.length < 5
    ) {
      alert("시간/분 을 정확히 다 입력해주세요(ex: 10:07-11:28)");
      event.preventDefault();
      return;
    }
    let startHour = startTimeInput[i].value.split(":")[0];
    let startMinute = startTimeInput[i].value.split(":")[1];
    let endHour = endTimeInput[i].value.split(":")[0];
    let endMinute = endTimeInput[i].value.split(":")[1];
    if (
      startHour >= 24 ||
      endHour >= 24 ||
      startMinute >= 60 ||
      endMinute >= 60
    ) {
      alert("00:00 ~ 23:59 안에서 입력 가능합니다.");
      event.preventDefault();
      return;
    } else if (
      startHour > endHour ||
      (startHour == endHour && startMinute > endMinute)
    ) {
      alert("시작시간이 종료시간 보다 클 수 없습니다.");
      event.preventDefault();
      return;
    } else if (contentInput[i].value.length == 0) {
      alert("일정을 입력하세요.");
      event.preventDefault();
      return;
    }
  });
}
// cancelBtn
