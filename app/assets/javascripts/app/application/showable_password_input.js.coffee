# Inputs with a checkbox that changes the type of the input
# to show passwords as text (and the opposite).
class Mconf.ShowablePassword

  # Changes the type of an input tag.
  # Example:
  #   changeInputType("#moderator_password", 'password')
  @changeInputType: (id, type) ->
    marker = $("<span />").insertBefore(id)
    $(id).detach().attr("type", type).insertAfter marker
    marker.remove()

  # Clicking in the checkboxes changes the type of the input to text/password.
  @bind: ->
    $(document).on "click", ".showable_password input[type=checkbox]", ->
      $parent = $(this).parents(".showable_password")
      target = $parent.find("input.showable_password")
      id = "#" + target.attr("id")
      console.log target.length
      if $(this).is(':checked')
        Mconf.ShowablePassword.changeInputType(id, "text")
      else
        Mconf.ShowablePassword.changeInputType(id, "password")

$ ->
  Mconf.ShowablePassword.bind()
