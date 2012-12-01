require 'spec_helper'

describe SitesController do
  render_views

  pending "#show"

  pending "#edit"

  pending "#update"

  describe "authentication:" do
    it { should require_authentication_for(:show) }
    it { should require_authentication_for(:edit) }
    it { should require_authentication_for(:update) }
  end

  describe "abilities:" do
    let(:site) { FactoryGirl.create(:site) }

    # non-members are blocked in the authentication, no need to test here

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:show) }
      it { should_not deny_access_to(:update, { :id => site, :site => {} }).via(:put) }
      it { should_not deny_access_to(:edit, { :id => site }) }
    end

    context "a normal user" do
      login_user
      it { should deny_access_to(:show) }
      it { should deny_access_to(:update, { :id => site, :site => {} }).via(:put) }
      it { should deny_access_to(:edit, { :id => site }) }
    end
  end

end
