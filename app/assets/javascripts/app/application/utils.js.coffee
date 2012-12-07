# Mconf Utilities module

Mconf.Utils = {}

# Returns true if we're currently in the view 'action' inside 'controller'.
# If 'action' is empty, will check only for the controller.
# Works only if classes are set in <body>.
#
# Examples:
#   isOnPage 'homes', 'show'
#   isOnPage 'spaces', 'new|create'
#   isOnPage 'events'
Mconf.Utils.isOnPage = (controller, action='') ->
  if action is ''
    return $('body').is ".#{controller}"
  else
    actions = action.split("|")
    for act in actions
      if $('body').is ".#{controller}.#{act}"
        return true
    return false

# Converts a string to a slug. Example:
#   stringToSlug("My Awesome String")
#   > "my-awesome-string"
#
# From:
# http://dense13.com/blog/2009/05/03/converting-string-to-slug-javascript/
Mconf.Utils.stringToSlug = (str) ->
  str = str.replace(/^\s+|\s+$/g, '')
  str = str.toLowerCase()

  # remove accents, swap ñ for n, etc
  from = "ãàáäâẽèéëêĩìíïîõòóöôũùúüûñçć·/_,:;!"
  to   = "aaaaaeeeeeiiiiiooooouuuuuncc-------"
  for i in [0..from.length]
    str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i))

  str.replace(/[^a-z0-9 -]/g, '') # remove invalid chars
     .replace(/\s+/g, '-') # collapse whitespace and replace by -
     .replace(/-+/g, '-') # collapse dashes
