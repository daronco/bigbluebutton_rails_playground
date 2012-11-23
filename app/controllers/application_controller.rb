class ApplicationController < ActionController::Base
  protect_from_forgery

  check_authorization :unless => :devise_controller?

  before_filter :load_locale

  # def current_user=(user)
  #   current_user = user
  # end

  def current_ability
    @current_ability ||= Abilities.ability_for(current_user)
  end

  def bigbluebutton_role(room)
    if room.private or current_user.nil?
      :password
    else
      :moderator
    end
  end

  # Returns the deafult path to where the user should be redirected,
  # considering the current params, referer and current user.
  def default_return_path
    if params.has_key?(:return_to)
      params[:return_to]
    elsif request.env["HTTP_REFERER"]
      :back
    elsif user_signed_in?
      home_path
    else
      root_path
    end
  end

  # Sets the flash message
  def set_flash(type, msg)
    flash[type] = msg
  end

  # Set the locale in the current session and as a default to
  # the user (if any)
  # TODO: this could be moved to a Locales class/module
  def set_current_locale(locale)
    if I18n.available_locales.include?(locale)
      session[:locale] = locale if session
      current_user.update_attribute(:locale, locale) if user_signed_in?
      true
    else
      false
    end
  end

  private

  # Loads the current locale in the I18n module.
  # The locale depends on the current user and site, if any.
  # TODO: this could be moved to a Locales class/module
  def load_locale
    selected = nil

    if user_signed_in? and current_user.is_a?(User) and
        current_user.locale.present?
      selected = current_user.locale.to_sym
    elsif session[:locale]
      selected = session[:locale]
    # elsif current_site and current_site.locale
    #   selected = current_site.locale
    end

    if I18n.available_locales.include?(selected)
      I18n.locale = selected
    else
      I18n.locale = I18n.default_locale
    end
  end

end
