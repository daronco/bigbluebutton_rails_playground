# Notifications using bootstrap-notify

class Mconf.Notification

  @setup: ->
    $("div.notifications[name='error'], div.notifications[name='alert']").notify(
      message: $(this).attr("data-message")
      type: "error"
      fadeOut:
        enabled: false
        delay: 10000
    ).show()
    $("div.notifications[name='success']").notify(
      message: $(this).attr("data-message")
      type: "success"
      fadeOut:
        enabled: true
        delay: 4000
    ).show()
    $("div.notifications[name='notice']").notify(
      message: $(this).attr("data-message")
      type: "success"
      fadeOut:
        enabled: true
        delay: 4000
    ).show()

$ ->
  Mconf.Notification.setup()
