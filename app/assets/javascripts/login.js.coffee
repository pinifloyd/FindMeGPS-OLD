$(document).ready ->
  signIn         = $('#signin')
  signInDropdown = $('#signin-dropdown')

  signIn.toggle (->
    console.log(signIn)
    signIn.addClass('selected')
    signInDropdown.slideDown()
  ), ->
    signInDropdown.slideUp ->
      signIn.removeClass('selected')
