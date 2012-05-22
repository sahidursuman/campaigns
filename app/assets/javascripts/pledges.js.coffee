#= require stripe
#= require facebook

postToFeed = ->
  obj =
    method: 'feed'
    link: 'https://www.oupledge.com'
    name: 'Oakland University Alumni Association'
    picture: 'http://kiindly.net/sites/oaklandalum/oaklandalum-pinterest.jpg'
    caption: 'Kiindly Penny Pledge'
    description: "I just made a difference at oupledge.com. Help increase
      everyone's donation by one penny by taking the OUAA Penny Pledge,
      or just donating. Every person and every penny counts!"
  callback = (response) ->
  FB.ui obj, callback
  false

jQuery ->
  # only allow numbers in the fixed amount text field
  $('.positive-integer').numeric { decimal: false, negative: false }

  $('#facebook_popup').click ->
    postToFeed()
    false

  # add the tooltips to the Learn More elements
  $(".whatisthis").tooltip({position: 'bottom center', relative: true})

