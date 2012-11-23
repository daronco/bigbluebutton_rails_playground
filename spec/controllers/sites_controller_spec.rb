require 'spec_helper'

describe SitesController do
  render_views

  pending "#show"

  pending "#edit"

  pending "#update"

  describe "authentication:" do
    let(:site) { FactoryGirl.create(:site) }
    after { response.should redirect_to new_user_session_path }
    its("#show") { get :show }
    its("#edit") { get :edit, :id => site }
    its("#update") { put :update, :id => site, :site => {'these' => 'params'} }
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
