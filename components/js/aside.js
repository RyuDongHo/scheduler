// 전역 변수
let isAsideOpen = false;
let aside = document.querySelector("aside");
let upperArrow = document.querySelector(".aside__upper-arrow");
let lowerArrow = document.querySelector(".aside__lower-arrow");
let homeBtn = document.querySelector(".aside__home-btn");
let members = document.querySelectorAll(".aside__member");


// 페이지 이동 등록
document.querySelector(".aside__move-to-updateMyInfoPage").addEventListener("click", ()=>{
  location.href = "./updateMyInfoPage.jsp";
})
homeBtn.addEventListener("click", ()=>{
  location.href = "./schedulePage.jsp";
})
document.querySelector(".aside__logout-btn").addEventListener("click", ()=>{
  location.href = "./loginPage.jsp";
})

// aside 기능 등록
document.querySelector(".aside__toggle").addEventListener("click", clickAsideBtn);
for(let i = 0; i < members.length; ++i){
  members[i].addEventListener("click", ()=>{
    members[i].classList.add("aside__member--selected");
    location.href = "./schedulePage.jsp?userIdx=?" + members[i].getAttribute("idx") + "&year"
  })
}

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
    upperArrow.classList.add(".aside__upper-arrow--closed");
    upperArrow.classList.remove(".aside__upper-arrow--opened");
    lowerArrow.classList.add(".aside__lower-arrow--closed");
    lowerArrow.classList.remove(".aside__lower-arrow--opened");
    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "0";
    }
    aside.style.transform = "translateX(129px)";
    homeBtn.style.transform = "translateX(-52px)";
  } else {
    upperArrow.classList.add(".aside__upper-arrow--opened");
    upperArrow.classList.remove(".aside__upper-arrow--closed");
    lowerArrow.classList.add(".aside__lower-arrow--opened");
    lowerArrow.classList.remove(".aside__lower-arrow--closed");

    for (let i = 2; i < aside.children.length; ++i) {
      aside.children[i].style.opacity = "1";
    }
    aside.style.transform = "translateX(0px)";
    homeBtn.style.transform = "translateX(0px)";
  }
}



// 초기 상태 설정
clickAsideBtn();