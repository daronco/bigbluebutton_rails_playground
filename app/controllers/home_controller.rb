class HomeController < ApplicationController

  def index
    @servers = BigbluebuttonServer.all
    @rooms = BigbluebuttonRoom.all
  end

end
