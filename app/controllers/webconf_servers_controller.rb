class WebconfServersController < Bigbluebutton::ServersController
  before_filter :authenticate_user!
end
