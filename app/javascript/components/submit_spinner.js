export const submit_spinner = () => {
  const btn = document.querySelector('#delivery-add-btn');
  if (btn) {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("Prevented!");
      let body = document.querySelector("body")
      body.insertAdjacentHTML("afterbegin", `<div class="background-holder"><div class="central-box modal-body"><div class="spin"><h3 class="sentence">Calling Couriers</h3><div class="loader"></div></div></div></div>`);
      // document.querySelector('.background-holder').style.marginTop = window.pageYOffset;
      setInterval(newSentence, 1000);
      setTimeout(function(){
        document.querySelector("#new_delivery").submit()
      }, 3400)
    });
  }
};



let texts = ["Folding Planes", "Chasing Delivery Drivers", "Helping Santa"]
let index = 0;

export const newSentence = () => {
  document.querySelector(".sentence").innerHTML = texts[index];
  index < 3 ? index++ : index = 0;
};
