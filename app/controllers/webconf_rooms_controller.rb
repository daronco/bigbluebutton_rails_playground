class WebconfRoomsController < Bigbluebutton::RoomsController
  before_filter :authenticate_user!, :except => [:invite, :auth, :running]
  layout 'application', :except => [:join_mobile]
end
