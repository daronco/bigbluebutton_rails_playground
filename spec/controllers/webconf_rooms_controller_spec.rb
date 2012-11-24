require 'spec_helper'

describe WebconfRoomsController do
  render_views

  pending "uses the layout :application for all except :join_mobile"

  describe "authentication:" do
    let(:room) { FactoryGirl.create(:bigbluebutton_room) }
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }

    it { should require_authentication_for(:index) }
    it { should require_authentication_for(:new) }
    it { should require_authentication_for(:show, { :id => room }) }
    it { should require_authentication_for(:edit, { :id => room }) }
    it { should require_authentication_for(:update, { :id => room }).via(:put) }
    it { should require_authentication_for(:create).via(:post) }
    it { should require_authentication_for(:destroy, { :id => room }).via(:delete) }
    it { should require_authentication_for(:join, { :id => room }) }
    it { should require_authentication_for(:join_mobile, { :id => room }) }
    it { should require_authentication_for(:end, { :id => room }) }
    it { should require_authentication_for(:external, { :server_id => server.id }) }
    it { should require_authentication_for(:external_auth, { :server_id => server.id }).via(:post) }
    it { should_not require_authentication_for(:invite, { :id => room }) }
    it { should_not require_authentication_for(:running, { :id => room }) }
    it { should_not require_authentication_for(:auth, { :id => room }) }
  end

  describe "abilities:" do
    let(:room) { FactoryGirl.create(:bigbluebutton_room) }
    let(:server) { FactoryGirl.create(:bigbluebutton_server) }

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:index) }
      it { should_not deny_access_to(:new) }
      it { should_not deny_access_to(:update, { :id => room, :room => {} }).via(:put) }
      it { should_not deny_access_to(:show, { :id => room }) }
      it { should_not deny_access_to(:edit, { :id => room }) }
      it { should_not deny_access_to(:create, { :id => room, :room => FactoryGirl.attributes_for(:bigbluebutton_room) }).via(:post) }
      it { should_not deny_access_to(:destroy, { :id => room }).via(:delete) }
      it { should_not deny_access_to(:join, { :id => room }) }
      it { should_not deny_access_to(:join_mobile, { :id => room }) }
      it { should_not deny_access_to(:auth, { :id => room }).via(:post) }
      it { should_not deny_access_to(:end, { :id => room }) }
      it { should_not deny_access_to(:invite, { :id => room }) }
      it { should_not deny_access_to(:running, { :id => room }) }
      it { should_not deny_access_to(:external, { :server_id => server.id }) }
      it { should_not deny_access_to(:external_auth, { :server_id => server.id }).via(:post) }
    end

    context "a normal user" do
      login_user
      it { should deny_access_to(:index) }
      it { should deny_access_to(:new) }
      it { should deny_access_to(:update, { :id => room, :room => {} }).via(:put) }
      it { should deny_access_to(:show, { :id => room }) }
      it { should deny_access_to(:edit, { :id => room }) }
      it { should deny_access_to(:create, { :id => room, :room => FactoryGirl.attributes_for(:bigbluebutton_room) }).via(:post) }
      it { should deny_access_to(:destroy, { :id => room }).via(:delete) }
      it { should_not deny_access_to(:join, { :id => room }) }
      it { should_not deny_access_to(:join_mobile, { :id => room }) }
      it { should_not deny_access_to(:auth, { :id => room }).via(:post) }
      it { should_not deny_access_to(:end, { :id => room }) }
      it { should_not deny_access_to(:invite, { :id => room }) }
      it { should_not deny_access_to(:running, { :id => room }) }
      it { should deny_access_to(:external, { :server_id => server.id }) }
      it { should deny_access_to(:external_auth, { :server_id => server.id }).via(:post) }
    end

    context "an anonymous user" do
      # the actions that are denied are blocked in the authentication,
      # no need to test here
      it { should_not deny_access_to(:auth, { :id => room }).via(:post) }
      it { should_not deny_access_to(:invite, { :id => room }) }
      it { should_not deny_access_to(:running, { :id => room }) }
    end
  end

end
