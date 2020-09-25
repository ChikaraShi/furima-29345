function keisann() {
  const kakaku = document.getElementById("item-price");
  kakaku.addEventListener("input", function() {
    const tax = (document.getElementById("add-tax-price"));
    const rieki = document.getElementById("profit");

    const price = kakaku.value; 
    const zei = Math.round(price * 0.1); 
    const income = Math.round(price - zei)

    tax.innerHTML = zei
    rieki.innerHTML = income

  });
};
 window.addEventListener("load", keisann)