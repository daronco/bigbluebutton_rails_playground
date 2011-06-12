class ApplicationController < ActionController::Base
  protect_from_forgery

  def bigbluebutton_role(room)
    if room.private or current_user.nil?
      :password
    else
      :moderator
    end
  end

end
