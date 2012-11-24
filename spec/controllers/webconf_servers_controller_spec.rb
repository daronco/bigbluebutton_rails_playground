require 'spec_helper'

describe WebconfServersController do
  render_views

  describe "authentication:" do
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }
    it { should require_authentication_for(:index) }
    it { should require_authentication_for(:new) }
    it { should require_authentication_for(:show, { :id => server }) }
    it { should require_authentication_for(:edit, { :id => server }) }
    it { should require_authentication_for(:update, { :id => server }).via(:put) }
    it { should require_authentication_for(:create).via(:post) }
    it { should require_authentication_for(:destroy, { :id => server }).via(:delete) }
    it { should require_authentication_for(:rooms, { :id => server }) }
    it { should require_authentication_for(:activity, { :id => server }) }
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
