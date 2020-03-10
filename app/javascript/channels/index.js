// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)




function showHideCourierInfo() {
  if // API returns multiple couriers {
    document.getElementById("courier").innerHTML = "<%= f.input :courier, collection: Delivery::COURIERS %>";
  }


