class HomeController < ApplicationController

  before_filter :authenticate_user!

  def index
    @rooms = BigbluebuttonRoom.where(:owner_type => "User", :owner_id => current_user.id)
  end

end
