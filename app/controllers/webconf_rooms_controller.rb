class WebconfRoomsController < Bigbluebutton::RoomsController
  # TODO: external and external_auth are never accessible, review

  before_filter :authenticate_user!, :except => [:invite, :auth, :running]

  authorize_resource :class => BigbluebuttonRoom

  layout "application", :except => [:join_mobile]
  layout false, :only => [:join_mobile]
end
