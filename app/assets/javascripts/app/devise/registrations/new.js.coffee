#= require "./_register_form"

$ ->
  if isOnPage 'devise-registrations', 'new|create'
    Mconf.RegisterForm.setup()
