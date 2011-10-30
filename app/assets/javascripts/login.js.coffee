$(document).ready ->
  signIn         = $('#signin')
  signInDropdown = $('#signin-dropdown')

  signIn.toggle (->
    signIn.closest('div').addClass('selected')
    signInDropdown.slideDown()
  ), ->
    signInDropdown.slideUp ->
      signIn.closest('div').removeClass('selected')
