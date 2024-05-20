
window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});

