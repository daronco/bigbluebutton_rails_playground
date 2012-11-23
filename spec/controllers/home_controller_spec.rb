require 'spec_helper'

describe HomeController do
  include Devise::TestHelpers
  render_views

  describe "#index" do
    context "assigns rooms" do
      # TODO: try to use login_user
      before {
        @user = FactoryGirl.create(:user)
        @rooms = [ FactoryGirl.create(:bigbluebutton_room, :owner => @user),
                   FactoryGirl.create(:bigbluebutton_room, :owner => @user) ]
        2.times { FactoryGirl.create(:bigbluebutton_room) }
        sign_in @user
      }
      before(:each) { get :index }
      it { should assign_to(:rooms).with(@rooms) }
    end
  end

  describe "authentication:" do
    after { response.should redirect_to new_user_session_path }
    its("#index") { get :index }
  end

  describe "abilities:" do

    # non-members are blocked in the authentication, no need to test here

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:index) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:index) }
    end
  end

end
