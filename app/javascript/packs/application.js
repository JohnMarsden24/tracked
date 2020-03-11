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
