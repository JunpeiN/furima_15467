window.addEventListener('load', function(){

  const priceEnter = document.getElementById("item_price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceEnter.addEventListener('input', () => {
    const enterRegex = /^([1-9]\d*|0)$/
    const enterValue = document.getElementById("item_price").value;
    if (enterRegex.test(enterValue)) {
      addTax.innerHTML = Math.floor(enterValue * 0.1);
      profit.innerHTML = Math.floor(enterValue * 0.9);
    } else {
      addTax.innerHTML = '半角数字のみ入力可能'
      profit.innerHTML = '半角数字のみ入力可能'
    }
  })

})