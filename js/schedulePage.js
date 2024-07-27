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
      "./schedulePage.jsp?userIdx=" + currentUserIdx + "&year=" + currentYear + "&month=" + currentMonth;
  });
document
  .querySelector(".year-wrapper__increase-btn")
  .addEventListener("click", () => {
    ++currentYear;
    location.href =
      "./schedulePage.jsp?userIdx=" + currentUserIdx + "&year=" + currentYear + "&month=" + currentMonth;
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
      "./schedulePage.jsp?userIdx=" + currentUserIdx + "&year=" + currentYear + "&month=" + e.target.value;
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
      days[i].innerText;
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
  location.href = "./loginPage.jsp";
});

// aside 기능 등록
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
    upperArrow.style.transformOrigin = "0";
    upperArrow.style.transform = "rotate(-45deg)";
    upperArrow.style.left = "-1px";
    upperArrow.style.top = "2px";
    lowerArrow.style.transformOrigin = "0";
    lowerArrow.style.transform = "rotate(45deg)";
    // style을 직접 수정하는 게 아니라, class를 더 만들어서 붙이고 없애는 방식
    //

    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "0";
    }
    aside.style.transform = "translateX(129px)";
    homeBtn.style.transform = "translateX(-52px)";
  } else {
    upperArrow.style.transformOrigin = "100%";
    upperArrow.style.transform = "rotate(45deg)";
    upperArrow.style.left = "1px";
    upperArrow.style.top = "2px";
    lowerArrow.style.transformOrigin = "100%";
    lowerArrow.style.transform = "rotate(-45deg)";

    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "1";
    }
    aside.style.transform = "translateX(0px)";
    homeBtn.style.transform = "translateX(0px)";
  }
}

// 초기 상태 설정
clickAsideBtn();
