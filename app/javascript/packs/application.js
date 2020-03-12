require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require("turbolinks").start()
require("chartkick")
require("chart.js")
import "bootstrap";

//= require chartkick
//= require Chart.bundle
// const inTransit = document.querySelector(".in-transit-close")

// inTransit.addEventListener("click", (event) => {
//   event.parentElement.classList.add("hidden");
// })
import { submit_spinner } from "../components/submit_spinner"





document.addEventListener('turbolinks:load', () => {
  submit_spinner();
  document.querySelector("#query").addEventListener("keyup", event => {
    if (document.querySelector("#query").value.length == 0) {
      if (document.querySelector('#results')) {
        document.querySelector('#results').parentNode.removeChild(document.querySelector('#results'))
      }
    } else {
      document.querySelector('#search-form').dispatchEvent(new Event('submit', {bubbles: true}))
    }
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

    otwBtn.addEventListener('click', () => {
      otwColumn.style.display = 'none'
      otwShow.disabled = false
      otwShow.classList.add('showtag-fade')
      localStorage.setItem('otwhide', 'true')
    })

    otwShow.addEventListener('click', () => {
      otwColumn.style.display = 'block'
      otwShow.disabled = true
      otwShow.classList.remove('showtag-fade')
      localStorage.setItem('otwhide', 'false')
    })

    const otwhide = localStorage.getItem('otwhide');
    if(otwhide === 'true'){
      otwColumn.style.display = "none";
      otwShow.classList.add('showtag-fade')
      otwShow.disabled = false
  }

    delayedBtn.addEventListener('click', () => {
      delayedColumn.style.display = 'none'
      delayedShow.disabled = false
      delayedShow.classList.add('showtag-fade')
      localStorage.setItem('delayedhide', 'true')
    })

    delayedShow.addEventListener('click', () => {
      delayedColumn.style.display = 'block'
      delayedShow.disabled = true
      delayedShow.classList.remove('showtag-fade')
      localStorage.setItem('delayedhide', 'false')
    })

    const delayedhide = localStorage.getItem('delayedhide');
    if(delayedhide === 'true'){
      delayedColumn.style.display = "none";
      delayedShow.classList.add('showtag-fade')
      delayedShow.disabled = false
  }

      deliveredBtn.addEventListener('click', () => {
      deliveredColumn.style.display = 'none'
      deliveredShow.disabled = false
      deliveredShow.classList.add('showtag-fade')
      localStorage.setItem('deliveredhide', 'true')
    })

    deliveredShow.addEventListener('click', () => {
      deliveredColumn.style.display = 'block'
      deliveredShow.disabled = true
      deliveredShow.classList.remove('showtag-fade')
      localStorage.setItem('deliveredhide', 'false')
    })

    const deliveredhide = localStorage.getItem('deliveredhide');
    if(deliveredhide === 'true'){
      deliveredColumn.style.display = "none";
      deliveredShow.classList.add('showtag-fade')
      deliveredShow.disabled = false
  }
})



