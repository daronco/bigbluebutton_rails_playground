class FrontpageController < ApplicationController
  inherit_resources
  actions :show

  authorize_resource :class => false

  protected

  # no resource in this controller
  def resource
  end
end
