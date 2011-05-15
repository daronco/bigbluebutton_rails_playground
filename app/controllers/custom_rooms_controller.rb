class CustomRoomsController < Bigbluebutton::RoomsController
  before_filter :authenticate_user!, :except => [:invite, :auth, :running]
end
