require 'spec_helper'

describe WebconfRoomsController do
  render_views

  pending "authenticates user for all actions except :invite, :auth and :running"
  pending "uses the layout :application for all except :join_mobile"
end
