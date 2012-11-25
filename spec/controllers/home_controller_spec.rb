require 'spec_helper'

describe HomeController do
  include Devise::TestHelpers
  render_views

  pending "#show"

  describe "authentication:" do
    it { should require_authentication_for(:show) }
  end

  describe "abilities:" do

    # non-members are blocked in the authentication, no need to test here

    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:show) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:show) }
    end
  end

end
