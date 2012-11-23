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

  describe "abilities:" do
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }

    # non-members are blocked in the authentication, no need to test here

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:index) }
      it { should_not deny_access_to(:new) }
      it { should_not deny_access_to(:update, { :id => server, :server => {} }).via(:put) }
      it { should_not deny_access_to(:show, { :id => server }) }
      it { should_not deny_access_to(:edit, { :id => server }) }
      it { should_not deny_access_to(:create, { :id => server, :server => FactoryGirl.attributes_for(:bigbluebutton_server) }).via(:post) }
      it { should_not deny_access_to(:destroy, { :id => server }).via(:delete) }
      it { should_not deny_access_to(:rooms, { :id => server }) }
      it { should_not deny_access_to(:activity, { :id => server }) }
    end

    context "a normal user" do
      login_user
      it { should deny_access_to(:index) }
      it { should deny_access_to(:new) }
      it { should deny_access_to(:update, { :id => server, :server => {} }).via(:put) }
      it { should deny_access_to(:show, { :id => server }) }
      it { should deny_access_to(:edit, { :id => server }) }
      it { should deny_access_to(:create, { :id => server, :server => FactoryGirl.attributes_for(:bigbluebutton_server) }).via(:post) }
      it { should deny_access_to(:destroy, { :id => server }).via(:delete) }
      it { should deny_access_to(:rooms, { :id => server }) }
      it { should deny_access_to(:activity, { :id => server }) }
    end
  end

end
