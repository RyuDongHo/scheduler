let yearNum = document.querySelector(".year-wrapper__num");
let month = document.querySelector(".month");
let monthList = document.querySelector(".month-wrapper");
let currentYear = yearNum.innerText;
let currentMonth = month.value;
let days = document.querySelectorAll(".calendar__day");

let isAsideOpen = false;
let aside = document.querySelector("aside");
let upperArrow = document.querySelector(".aside__upper-arrow");
let lowerArrow = document.querySelector(".aside__lower-arrow");
let homeBtn = document.querySelector(".aside__home-btn");
let members = document.querySelectorAll(".aside__member");

//======================================= 캘린더 ===========================================
document
  .querySelector(".year-wrapper__dercrease-btn")
  .addEventListener("click", () => {
    --currentYear;
    location.href =
      "./schedulePage.jsp?userIdx=" +
      currentUserIdx +
      "&year=" +
      currentYear +
      "&month=" +
      currentMonth;
  });
document
  .querySelector(".year-wrapper__increase-btn")
  .addEventListener("click", () => {
    ++currentYear;
    location.href =
      "./schedulePage.jsp?userIdx=" +
      currentUserIdx +
      "&year=" +
      currentYear +
      "&month=" +
      currentMonth;
  });

month.addEventListener("click", () => {
  if (month.style.boxShadow.includes("inset")) {
    month.style.boxShadow = "0 4px 8px var(--color-blue)";
    monthList.style.display = "none";
  } else {
    month.style.boxShadow = "inset 0 4px 8px var(--color-blue)";
    monthList.style.display = "flex";
  }
});

monthList.addEventListener("click", (e) => {
  if (e.target.value != null) {
    location.href =
      "./schedulePage.jsp?userIdx=" +
      currentUserIdx +
      "&year=" +
      currentYear +
      "&month=" +
      e.target.value;
  }
});

for (let i = 0; i < days.length; ++i) {
  days[i].addEventListener("click", () => {
    location.href =
      "./selectedSchedulePage.jsp?userIdx=" +
      currentUserIdx +
      "&year=" +
      currentYear +
      "&month=" +
      currentMonth +
      "&day=" +
      days[i].getAttribute("day");
  });
}

//================================= aside =============================================

// 페이지 이동 등록
document
  .querySelector(".aside__move-to-updateMyInfoPage")
  .addEventListener("click", () => {
    location.href = "./updateMyInfoPage.jsp";
  });
homeBtn.addEventListener("click", () => {
  location.href = "./schedulePage.jsp";
});
document.querySelector(".aside__logout-btn").addEventListener("click", () => {
  location.href = "../action/logoutAction.jsp";
});

// aside 기능 등록
if (isLeader == 1) {
  for (let i = 0; i < members.length; ++i) {
    members[i].addEventListener("click", () => {
      currentUserIdx = members[i].getAttribute("idx");
      members[i].classList.add("aside__member--selected");
      location.href =
        "./schedulePage.jsp?userIdx=" +
        currentUserIdx +
        "&year=" +
        currentYear +
        "&month=" +
        currentMonth;
    });
  }
}
else{
  document.querySelector(".aside__member-list").classList.add("hide");
}

document
  .querySelector(".aside__toggle")
  .addEventListener("click", clickAsideBtn);
function clickAsideBtn() {
  if (!isAsideOpen) {
    isAsideOpen = true;
    toggleAside();
  } else {
    isAsideOpen = false;
    toggleAside();
  }
}
function toggleAside() {
  if (isAsideOpen) {
    upperArrow.classList.add("aside__upper-arrow--closed");
    upperArrow.classList.remove("aside__upper-arrow--opened");
    lowerArrow.classList.add("aside__lower-arrow--closed");
    lowerArrow.classList.remove("aside__lower-arrow--opened");
    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "0";
    }
    aside.style.transform = "translateX(129px)";
    homeBtn.style.transform = "translateX(-52px)";
  } else {
    upperArrow.classList.add("aside__upper-arrow--opened");
    upperArrow.classList.remove("aside__upper-arrow--closed");
    lowerArrow.classList.add("aside__lower-arrow--opened");
    lowerArrow.classList.remove("aside__lower-arrow--closed");

    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "1";
    }
    aside.style.transform = "translateX(0px)";
    homeBtn.style.transform = "translateX(0px)";
  }
}

// 초기 상태 설정
clickAsideBtn();
