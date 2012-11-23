class OauthAccessGrant < ActiveRecord::Base
  belongs_to :user
  belongs_to :oauth_app
  before_create :generate_tokens

  def self.prune!
    delete_all(["created_at < ?", 3.days.ago]) # TODO: or destroy_all?
  end

  def self.authenticate(code, application_id)
    OauthAccessGrant.where("code = ? AND oauth_app_id = ?", code, application_id).first
  end

  def generate_tokens
    self.code, self.access_token, self.refresh_token = SecureRandom.hex(16), SecureRandom.hex(16), SecureRandom.hex(16)
  end

  def redirect_uri_for(redirect_uri)
    if redirect_uri =~ /\?/
      redirect_uri + "&code=#{code}&response_type=code&state=#{state}"
    else
      redirect_uri + "?code=#{code}&response_type=code&state=#{state}"
    end
  end

  # Note: This is currently configured through devise, and matches the
  # OauthController access token life
  def start_expiry_period!
    self.update_attribute(:access_token_expires_at, Time.now + Devise.timeout_in)
  end
end
