class HomeController < ApplicationController
  before_filter :authenticate_user!

  authorize_resource :class => false

  def show
  end
end
