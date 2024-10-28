document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price');
  const taxPriceDisplay = document.getElementById('add-tax-price');
  const profitDisplay = document.getElementById('profit');

  if (priceInput) {  // 要素が存在する場合のみイベントを設定
    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value, 10);

      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const fee = Math.floor(price * 0.1);
        const profit = price - fee;

        taxPriceDisplay.textContent = fee.toLocaleString();
        profitDisplay.textContent = profit.toLocaleString();
      } else {
        taxPriceDisplay.textContent = '0';
        profitDisplay.textContent = '0';
      }
    });
  }
});
