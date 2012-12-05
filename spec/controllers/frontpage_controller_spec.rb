require 'spec_helper'

describe FrontpageController do
  include Devise::TestHelpers
  render_views

  pending "#show"

  describe "authentication:" do
    it { should_not require_authentication_for(:show) }
  end

  describe "abilities:" do

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:show) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:show) }
    end

    context "an anonymous user" do
      it { should_not deny_access_to(:show) }
    end
  end

end
