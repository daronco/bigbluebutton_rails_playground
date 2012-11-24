require 'version'

module ApplicationHelper

  def gravatar_for email, options = { }
    options = { :alt => 'avatar', :class => 'avatar', :size => 80}.merge! options
    id = Digest::MD5::hexdigest email.strip.downcase
    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
    options.delete :size
    image_tag url, options
  end

  def application_version
    Mconf::VERSION
  end

  def application_revision
    Mconf.application_revision
  end

  def application_branch
    Mconf.application_branch
  end

  # Ex: asset_exists?('news/edit', 'css')
  def asset_exists?(asset_name, default_ext)
    !BigbluebuttonRailsPlayground::Application.assets.find_asset(asset_name + '.' + default_ext).nil?
  end

  # Includes javascripts for the current controller
  # Example: 'assets/events.js'
  def javascript_include_tag_for_controller
    ctl = controller_name_for_view
    if asset_exists?(ctl, "js")
      javascript_include_tag(ctl)
    end
  end

  # Includes stylesheets for the current controller
  # Example: 'assets/events.css'
  def stylesheet_link_tag_for_controller(options={})
    ctl = controller_name_for_view
    if asset_exists?(ctl, "css")
      stylesheet_link_tag(ctl, options)
    end
  end

  # Returns the name of the current controller to be used in view
  # (for js and css names). Used to convert names with slashes
  # such as 'devise/sessions'.
  def controller_name_for_view
    params[:controller].parameterize
  end

  def github_link_to_revision(revision)
    "https://github.com/mconf/mconf-web/commit/#{revision}"
  end

  # Checks if the current page is the user's home page
  def at_home?
    params[:controller] == 'home' && params[:action] == 'show'
  end

end
