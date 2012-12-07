require 'spec_helper'

describe Devise::RegistrationsController do
  render_views

  context "redirects to /home after sign in" do
    login_user
    before(:each) { get :new }
    it { should redirect_to(home_path) }
  end
end
