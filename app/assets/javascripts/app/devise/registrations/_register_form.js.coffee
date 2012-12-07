class Mconf.RegisterForm
  @setup: ->
    @fullname = $("#user_name")
    @username = $("#user_username")
    @active = true
    @suggestedUsername = ""

    @replace()
    @fullname.on "input keyup", () => @replace()

    # deactivates if the user changes the username
    @username.on "input keyup", () =>
      if @username.attr("value").trim() != "" and
        @username.attr("value").trim() != @suggestedUsername
          @active = false
      else
        @active = true

  @replace: ->
    if @active
      @suggestedUsername = Mconf.Utils.stringToSlug(@fullname.attr("value"))
      @username.attr "value", @suggestedUsername
