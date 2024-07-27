// 전역 변수
let isAsideOpen = false;
let aside = document.querySelector("aside");
let upperArrow = document.querySelector(".aside__upper-arrow");
let lowerArrow = document.querySelector(".aside__lower-arrow");
let homeBtn = document.querySelector(".aside__home-btn");


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