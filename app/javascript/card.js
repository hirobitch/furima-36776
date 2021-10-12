const pay = () => {
  Payjp.setPublicKey("pk_test_da983d1964ee2ff9425bcfce")
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_address[card_number]"),
      cvc: formData.get("purchase_address[card_cvc]"),
      exp_month: formData.get("purchase_address[card_exp_month]"),
      exp_year: `20${formData.get("purchase_address[card_exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} authenticity_token='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("purchase_address[card_number]");
      document.getElementById("card-cvc").removeAttribute("purchase_address[card_cvc]");
      document.getElementById("card-exp-month").removeAttribute("purchase_address[card_exp_month]");
      document.getElementById("card-exp-year").removeAttribute("purchase_address[card_exp_year]");

      document.getElementById("button").submit();
    });
  });
};


window.addEventListener("load", pay);