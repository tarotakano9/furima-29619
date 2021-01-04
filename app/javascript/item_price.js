function calculateTaxAndProfit() {
  const priceInput = document.getElementById("item-price");
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = Math.floor(inputValue - (inputValue * 0.1))
}

setInterval(calculateTaxAndProfit,1000);