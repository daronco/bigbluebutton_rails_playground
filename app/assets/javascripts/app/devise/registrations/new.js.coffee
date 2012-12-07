#= require "./_register_form"

$ ->
  if Mconf.Utils.isOnPage 'devise-registrations', 'new|create'
    Mconf.RegisterForm.setup()
