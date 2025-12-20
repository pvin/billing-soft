import $ from "jquery"

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

$(document).on("turbo:load", function () {
  let index = $("#products-container .product-row").length;

  $("#add-product").on("click", function () {
    const row = `
      <div class="row g-3 mb-2 product-row">
        <div class="col-md-4 offset-md-4">
          <input type="text"
                 name="products[${index}][product_id]"
                 class="form-control"
                 placeholder="Product ID">
        </div>
        <div class="col-md-3">
          <input type="number"
                 name="products[${index}][quantity]"
                 class="form-control"
                 placeholder="Quantity">
        </div>
      </div>
    `;

    $("#products-container").append(row);
    index++;
  });
});
