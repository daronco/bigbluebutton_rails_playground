require 'spec_helper'

describe WebconfServersController do
  render_views

  describe "authentication:" do
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }
    after { response.should redirect_to new_user_session_path }
    its("#index") { get :index }
    its("#new") { get :new }
    its("#show") { get :show, :id => server }
    its("#edit") { get :edit, :id => server }
    its("#update") { put :update, :id => server, :server => {'these' => 'params'} }
    its("#create") { post :create, :server => FactoryGirl.attributes_for(:bigbluebutton_server) }
    its("#destroy") { delete :destroy, :id => server }
    its("#rooms") { get :rooms, :id => server }
    its("#activity") { get :activity, :id => server }
  end
end
