// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


// document.getElementById("name").addEventListener

// const tracking_number = document.getElementById("tracking_number").value

document.getElementById("submit").addEventListener("click", (event) => {
    const tracking_number = document.getElementById("delivery_tracking_number").value
    showHideCourierInfo("fedex-uk", tracking_number)
});

const body_data = {
        "tracking": {
          "slug": `${slug}`,
          "tracking_number": `${tracking_number}`,
        }
      }


const showHideCourierInfo = (slug, tracking_number) => {
  fetch('https://api.aftership.com/v4/trackings', {
    method: 'POST',
    headers: {
      'aftership-api-key': '7beee5c2-ca2b-49c5-a0c8-ee57c0b18434',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(body_data),
  })
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    // if statement here
  })
}

// showHideCourierInfo("fedex-uk", tracking_number)

