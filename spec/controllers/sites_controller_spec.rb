require 'spec_helper'

describe SitesController do
  render_views

  pending "calls authenticate_user! for all"

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
end
