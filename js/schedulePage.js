let yearNum = document.querySelector(".year-wrapper__num");
let month = document.querySelector(".month");
let monthList = document.querySelector(".month-wrapper");

document.querySelector(".calendar__week-wrapper").addEventListener("click", ()=>{
  location.href = "./selectedSchedulePage.jsp";
})
document.querySelector(".year-wrapper__dercrease-btn").addEventListener("click", () => {
  let num = yearNum.innerText;
  yearNum.innerText = --num;
});
document.querySelector(".year-wrapper__increase-btn").addEventListener("click", () => {
  let num = yearNum.innerText;
  yearNum.innerText = ++num;
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

monthList.addEventListener("click", (e)=>{
  if(e.target.value != null) month.value = e.target.value;
})