class OauthController < ApplicationController
  before_filter :authenticate_user!, :except => [:access_token, :user] # TODO: why user?
  skip_before_filter :verify_authenticity_token, :only => [:access_token]

  skip_authorization_check

  def authorize
    OauthAccessGrant.prune!
    access_grant = current_user.oauth_access_grants.create({:oauth_app => application, :state => params[:state]}, :without_protection => true)
    redirect_to access_grant.redirect_uri_for(params[:redirect_uri])
  end

  def access_token
    application = OauthApp.authenticate(params[:client_id], params[:client_secret])

    if application.nil?
      render :json => {:error => "Could not find application"}
      return
    end

    access_grant = OauthAccessGrant.authenticate(params[:code], application.id)
    if access_grant.nil?
      render :json => {:error => "Could not authenticate access code"}
      return
    end

    access_grant.start_expiry_period!
    render :json => {
      :access_token => access_grant.access_token,
      :refresh_token => access_grant.refresh_token,
      :expires_in => Devise.timeout_in.to_i
    }
  end

  def user
    hash = {
      :provider => "mconf_id",
      :id => current_user.id.to_s,
      :info => {
         :email => current_user.email,
      },
      :extra => {
         :name => current_user.name,
      }
    }
    render :json => hash.to_json
  end

  protected

  def application
    @application ||= OauthApp.find_by_app_id(params[:client_id])
  end

end
