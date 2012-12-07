#= require "../devise/registrations/_register_form"

$ ->
  if isOnPage 'frontpage', 'show'
    Mconf.RegisterForm.setup()
