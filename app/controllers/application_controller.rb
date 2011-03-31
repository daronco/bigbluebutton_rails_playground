class ApplicationController < ActionController::Base
  protect_from_forgery

  def bigbluebutton_role(room)
    :attendee
  end

end
