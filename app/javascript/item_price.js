const price = () => {
  const priceInput = document.getElementById('item-price');
  const taxPriceDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {  // 要素が存在する場合のみイベントを設定
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);

      if (price >= 0) { 
        const fee = Math.floor(price * 0.1);
        const profit = price - fee;

        taxPriceDisplay.textContent = fee.toLocaleString();
        profitDisplay.textContent = profit.toLocaleString();
      } else {
        taxPriceDisplay.textContent = '0';
        profitDisplay.textContent = '0';
      }
   });
  };
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
