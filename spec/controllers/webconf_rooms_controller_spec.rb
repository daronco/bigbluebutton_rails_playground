require 'spec_helper'

describe WebconfRoomsController do
  render_views

  pending "uses the layout :application for all except :join_mobile"

  describe "authentication:" do
    let(:room) { FactoryGirl.create(:bigbluebutton_room) }
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }

    context "blocked actions" do
      after { response.should redirect_to new_user_session_path }
      its("#index") { get :index }
      its("#new") { get :new }
      its("#show") { get :show, :id => room }
      its("#edit") { get :edit, :id => room }
      its("#update") { put :update, :id => room, :room => {'these' => 'params'} }
      its("#create") { post :create, :room => FactoryGirl.attributes_for(:bigbluebutton_room) }
      its("#destroy") { delete :destroy, :id => room }
      its("#join") { get :join, :id => room }
      its("#join_mobile") { get :join_mobile, :id => room }
      its("#end") { get :end, :id => room }
      its("#external") { get :external, :server_id => server.id }
      its("#external_auth") { post :external_auth, :server_id => server.id }
    end

    context "allowed actions" do
      its("#invite") {
        get :invite, :id => room
        controller.should respond_with(:success)
      }
      its("#running") {
        get :invite, :id => room
        controller.should respond_with(:success)
      }

      describe "#auth" do
        # the easiest way to test it is to pass an invalid room so the action
        # will redirect to :back before anything else
        before(:each) {
          request.env["HTTP_REFERER"] = "/back/from/auth"
          post :auth, :id => FactoryGirl.attributes_for(:bigbluebutton_room)
        }
        it { should respond_with(:redirect) }
        it { should redirect_to("/back/from/auth") }
      end
    end

  end
end
