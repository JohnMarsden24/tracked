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

const FusionCharts = require("src/fusioncharts/fusioncharts");

// Require charts from fusioncharts
const Charts = require("src/fusioncharts/fusioncharts.charts");

// Require export module from fusioncharts
const ExcelExport = require("src/fusioncharts/fusioncharts.excelexport");

// Require theme from fusioncharts
const FusionTheme = require("src/fusioncharts/themes/fusioncharts.theme.fusion");

// Add charts and themes and export module as dependency
Charts(FusionCharts);
FusionTheme(FusionCharts);
ExcelExport(FusionCharts);

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
