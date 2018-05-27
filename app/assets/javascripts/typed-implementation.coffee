ready = ->
  $('.element').typed
    strings: [
      "Software development shouldn't be mystical voodoo."
      "When I take on a new project I make it my goal to not only deliver a well crafted product, I also ensure that each stage of the process is fully communicated."
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
