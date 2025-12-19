document.addEventListener("DOMContentLoaded", () => {
  const denominationInputs = document.querySelectorAll(".denomination-input");
  const cashPaidInput = document.querySelector("input[name='cash_paid']");
  if (!cashPaidInput) return;

  const calculateTotal = () => {
    let total = 0;

    denominationInputs.forEach(input => {
      const count = parseInt(input.value || 0, 10);
      const value = parseInt(input.dataset.value, 10);
      total += count * value;
    });

    cashPaidInput.value = total;
  };

  denominationInputs.forEach(input => {
    input.addEventListener("input", calculateTotal);
  });
});
