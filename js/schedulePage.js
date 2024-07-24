let yearNum = document.getElementById("yearNum");
let month = document.getElementById("month");
let monthList = document.getElementById("monthList");

document.getElementById("btn-decreaseYear").addEventListener("click", () => {
  let num = yearNum.innerText;
  yearNum.innerText = --num;
});
document.getElementById("btn-increaseYear").addEventListener("click", () => {
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