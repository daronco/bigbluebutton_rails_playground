class SitesController < ApplicationController
  inherit_resources
  actions :edit, :update

  before_filter :authenticate_user!

  authorize_resource :class => false

  respond_to :html

  def update
    update!{ edit_site_path }
  end

  protected

  def resource
    @site ||= Site.current
  end
end
