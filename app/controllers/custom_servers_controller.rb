class CustomServersController < Bigbluebutton::ServersController
  before_filter :authenticate_user!
end
