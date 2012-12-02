require 'spec_helper'

describe UsersController do
  render_views

  pending "#show"

  describe "authentication:" do
    let(:user) { FactoryGirl.create(:user) }
    it { should_not require_authentication_for(:show, { :id => user }) }
  end

  describe "abilities:" do
    let(:user) { FactoryGirl.create(:user) }

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:show, { :id => user }) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:show, { :id => user }) }
    end

    context "an anonymous user" do
      it { should deny_access_to(:show, { :id => user }) }
    end
  end

end
