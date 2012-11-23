def check_conditions
  if Rails.env.production? and Site.table_exists?
    site = Site.current
    return site &&
      site.respond_to?(:exception_notifications) &&
      site.exception_notifications
  else
    false
  end
end

def get_sender_address
  site = Site.current
  if site.respond_to?(:name) && site.respond_to?(:smtp_sender)
    %("#{site.name}" <#{site.smtp_sender}>)
  else
    "Undefined"
  end
end

# Initializes the ExceptionNotifier using the information stored in the current Site
# Works only in production
def configure_exception_notifier
  site = Site.current

  # accepts " ", "," and ";" as separators
  recvs = site.exception_notifications_email.split(/[\s,;]/).reject(&:empty?)

  BigbluebuttonRailsPlayground::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => site.exception_notifications_prefix + " ",
    :sender_address => get_sender_address(),
    :exception_recipients => recvs
end

if check_conditions()
  configure_exception_notifier()
end
