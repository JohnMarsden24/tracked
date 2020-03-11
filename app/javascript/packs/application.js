require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()
import "bootstrap";

// const inTransit = document.querySelector(".in-transit-close")

// inTransit.addEventListener("click", (event) => {
//   event.parentElement.classList.add("hidden");
// })

document.addEventListener('turbolinks:load', () => {
  document.querySelector("#query").addEventListener("keyup", event => {
    if (document.querySelector("#query").value.length == 0) {
      if (document.querySelector('#results')) {
        document.querySelector('#results').parentNode.removeChild(document.querySelector('#results'))
      }
    } else {
      document.querySelector('#search-form').dispatchEvent(new Event('submit', {bubbles: true}))
    }
  })
})

const otwBtn = document.querySelector(".otw-btn");
const otwShow = document.querySelector(".otw-show");
const delayedBtn = document.querySelector(".delayed-btn");
const delayedShow = document.querySelector(".delayed-show");
const deliveredBtn = document.querySelector(".delivered-btn");
const deliveredShow = document.querySelector(".delivered-show");

const otwColumn = document.querySelector(".otw-column");
const delayedColumn = document.querySelector(".delayed-column");
const deliveredColumn = document.querySelector(".delivered-column");




document.addEventListener('turbolinks:load', () => {
    otwBtn.addEventListener('click', () => {
      otwColumn.style.display = 'none'
      localStorage.setItem('otwhide', 'true')
    })

    otwShow.addEventListener('click', () => {
      otwColumn.style.display = 'block'
      localStorage.setItem('otwhide', 'false')
    })

    const otwhide = localStorage.getItem('otwhide');
    if(otwhide === 'true'){
      otwColumn.style.display = "none";
  }

    delayedBtn.addEventListener('click', () => {
      delayedColumn.style.display = 'none'
      localStorage.setItem('delayedhide', 'true')
    })

    delayedShow.addEventListener('click', () => {
      delayedColumn.style.display = 'block'
      localStorage.setItem('delayedhide', 'false')
    })

    const delayedhide = localStorage.getItem('delayedhide');
    if(delayedhide === 'true'){
      delayedColumn.style.display = "none";
  }

      deliveredBtn.addEventListener('click', () => {
      deliveredColumn.style.display = 'none'
      localStorage.setItem('deliveredhide', 'true')
    })

    deliveredShow.addEventListener('click', () => {
      deliveredColumn.style.display = 'block'
      localStorage.setItem('deliveredhide', 'false')
    })

    const deliveredhide = localStorage.getItem('deliveredhide');
    if(deliveredhide === 'true'){
      deliveredColumn.style.display = "none";
  }
})



