require 'spec_helper'

describe ProfilesController do
  render_views

  pending "#update"

  describe "authentication:" do
    it { should require_authentication_for(:update) }
  end

  describe "abilities:" do
    let(:profile) { FactoryGirl.create(:profile) }

    # non-members are blocked in the authentication, no need to test here

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:update, { :id => profile, :profile => {} }).via(:put) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:update, { :id => profile, :profile => {} }).via(:put) }
    end
  end

end
