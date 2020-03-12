const image = `<svg width="1920" height="1080" xmlns="http://www.w3.org/2000/svg'><g fill="none" fill-rule="evenodd"><path d="M1905 172.5S1441.5 63 1006.5 314s-221 610-46.5 674 434.5-4.5 403.5-349c-20.667-229.667-307.167-385.167-859.5-466.5" stroke="#246A73" stroke-width="2" stroke-linecap="square" stroke-dasharray="8,12"/><g fill-rule="nonzero"><path fill="#C6CBCB" d="M436.849 118.3l229.313 86.515-11.995-46.198z"/><path fill="#246A73" d="M576.343 144.18l5.043 28.65 84.776 31.985-11.995-46.198z"/><path fill="#D1D5D5" d="M666.162 204.815l-29.615-22.119L436.849 118.3l191.674 81.023z"/><path fill="#E2E5E7" d="M636.547 182.696l-42.024 83.715L436.849 118.3zM654.167 158.617L436.849 118.3l261.245-21.493z"/><path fill="#368F8B" d="M558.154 157.418l30.827 103.787 5.542 5.206 42.057-83.805zM687.342 97.693l-110.999 46.486 77.875 14.634 43.876-62.006z"/><path fill="#246A73" d="M558.154 157.418l30.827 103.787-25.084-101.943zM576.343 144.18l6.946 1.305 104.053-47.792z"/><path fill="#C6CBCB" d="M636.58 182.606l-8.33 16.601 15.405 2.323z"/><path fill="#368F8B" d="M452.66 132.811l-.26-9.986-15.766-4.883zM453.434 121.53l9.095-5.148-25.895 1.56z"/></g></g></svg`


export const submit_spinner = () => {
  const btn = document.querySelector('#delivery-add-btn');
  if (btn) {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      console.log("Prevented!");
      let body = document.querySelector("body")
      body.insertAdjacentHTML("afterbegin", `<div class="background-holder"><div class="central-box modal-body"><div class="spin"><h3 class="sentence">calling couriers...</h3><div class="loader"></div></div></div></div>`);
      // document.querySelector('.background-holder').style.marginTop = window.pageYOffset;
      setInterval(newSentence, 1000);
      setTimeout(function(){
        document.querySelector("#new_delivery").submit()
      }, 3400)
    });
  }
};



let texts = ["folding planes...", "chasing delivery drivers...", "finding your parcel...", "washing hands..."]
let index = 0;

export const newSentence = () => {
  document.querySelector(".sentence").innerHTML = texts[index];
  index < 3 ? index++ : index = 0;
};


