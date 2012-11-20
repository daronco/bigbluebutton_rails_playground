class SitesController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def show
    @site = Site.current # TODO: remove after cancan
    respond_with(@site)
  end

  def edit
    @site = Site.current # TODO: remove after cancan
    respond_with(@site)
  end

  def update
    @site = Site.current # TODO: remove after cancan
    if @site.update_attributes(params[:site])
      respond_with(@site, :location => site_path)
    else
      respond_with(@site, :location => edit_site_path(@site))
    end
  end
end
