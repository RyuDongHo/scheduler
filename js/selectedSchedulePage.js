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

  deleteBtn[i].addEventListener("click", () => {
    deleteBtn[i].parentElement.childNodes[1].style.boxShadow = "0 4px 8px var(--color-gray)";
    modifyBtn[i].style.boxShadow = "0 0 0 0";
    modifyBtn[i].style.backgroundColor = "var(--color-gray)";
    modifyBtn[i].style.pointerEvents = "none";
    deleteBtn[i].style.boxShadow = "0 0 0 0";
    deleteBtn[i].style.backgroundColor = "var(--color-gray)";
    content[i].style.textDecoration = "line-through";
    
  })
}

