let yearNum = document.querySelector(".year-wrapper__num");
let month = document.querySelector(".month");
let monthList = document.querySelector(".month-wrapper");
let currentYear = yearNum.innerText;
let currentMonth = month.value;



document.querySelector(".year-wrapper__dercrease-btn").addEventListener("click", () => {
  --currentYear;
  location.href = "./schedulePage.jsp?year=" + currentYear + "&month=" + currentMonth;
});
document.querySelector(".year-wrapper__increase-btn").addEventListener("click", () => {
  ++currentYear;
  location.href = "./schedulePage.jsp?year=" + currentYear + "&month=" + currentMonth;
});

month.addEventListener("click", () => {
  console.log("T")
  if (month.style.boxShadow.includes("inset")) {
    month.style.boxShadow = "0 4px 8px var(--color-blue)";
    monthList.style.display = "none";
  } else {
    month.style.boxShadow = "inset 0 4px 8px var(--color-blue)";
    monthList.style.display = "flex";
  }
});

monthList.addEventListener("click", (e)=>{
  if(e.target.value != null) {
    location.href = "./schedulePage.jsp?year=" + currentYear + "&month=" + e.target.value;
  }
})