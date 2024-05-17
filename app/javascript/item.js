
window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 //  console.log(priceInput)
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     // console.log(priceInput.innerHTML);
     addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     // console.log(priceInput.innerHTML);
     addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});
