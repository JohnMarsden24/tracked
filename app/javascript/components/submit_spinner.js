export const submit_spinner = () => {
  const btn = document.getElementById('delivery-add-btn');
  if (btn) {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("Prevented!");
      let body = document.querySelector("body")
      body.insertAdjacentHTML("beforebegin", `<div class="background-holder"><div class="central-box"><div class="spin"><h3 class="sentence">Finding clean products</h3><div class="loader"></div></div></div></div>`);
      // document.querySelector('.background-holder').style.marginTop = window.pageYOffset;
      setInterval(newSentence, 1000);
      setTimeout(function(){ window.location.href = "/compare"; }, 3400);
    });
  }
};



let texts = ["Planting trees", "Turning plastic into quinoa", "Saving the planet"]
let index = 0;

export const newSentence = () => {
  document.querySelector(".sentence").innerHTML = texts[index];
  index < 3 ? index++ : index = 0;
};
