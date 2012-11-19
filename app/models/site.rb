class Site < ActiveRecord::Base

  validates :name, :presence => true

  validates :domain, :presence => true

  # Returns the current (default) Site
  def self.current
    Site.where(:current => true).first
  end

  # HTTP protocol based on SSL settings
  def protocol
    "http"
    # TODO: ssl, see if we need this
    # "http#{ ssl? ? 's' : nil }"
  end

  # Domain http url considering protocol
  # e.g. http://server.org
  def domain_with_protocol
    "#{protocol}://#{domain}"
  end

  # Formatted email address for the Site
  def email_with_name
    "#{name} <#{email}>"
  end
end
