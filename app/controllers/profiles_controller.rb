class ProfilesController < ApplicationController
  inherit_resources
  actions :update

  before_filter :authenticate_user!

  authorize_resource

  def update
    update!{ edit_user_registration_path }
  end

  protected

  def resource
    @profile ||= current_user.profile
  end
end
