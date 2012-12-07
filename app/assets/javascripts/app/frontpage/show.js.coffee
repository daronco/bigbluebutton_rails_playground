#= require "../devise/registrations/_register_form"

$ ->
  if Mconf.Utils.isOnPage 'frontpage', 'show'
    Mconf.RegisterForm.setup()
