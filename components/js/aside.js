// 전역 변수
let isAsideOpen = false;
let aside = document.querySelector(".aside");
let upperArrow = document.getElementById("upperArrow");
let lowerArrow = document.getElementById("lowerArrow");
let homeBtn = document.getElementById("btn-resetSchedulePage");


// 기능 등록
document.getElementById("btn-moveToUpdateMyInfoPage").addEventListener("click", ()=>{
  location.href = "./updateMyInfoPage.jsp";
})
document.getElementById("btn-resetSchedulePage").addEventListener("click", ()=>{
  location.href = "./schedulePage.jsp";
})
document.getElementById("btn-logOut").addEventListener("click", ()=>{
  location.href = "./loginPage.jsp";
})
document.getElementById("btn-toggleAside").addEventListener("click", clickAsideBtn);

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