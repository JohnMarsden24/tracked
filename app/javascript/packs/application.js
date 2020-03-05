require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

const tags = document.querySelectorAll(".tag")

tags.forEach ((tag) => {
  const tagData = tag.innerHTML
  tag.addEventListener("mouseover", (event) =>
  tag.innerHTML+= "<i class='fas fa-trash-alt'></i>"
)
  tag.addEventListener("mouseout", (event) =>
  tag.innerHTML = tagData
  )
})

