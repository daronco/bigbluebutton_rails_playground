class SitesController < ApplicationController
  inherit_resources
  actions :show, :edit, :update

  before_filter :authenticate_user!

  respond_to :html

  def update
    update!{ site_path }
  end

  protected

  def resource
    @site ||= Site.current
  end
end
