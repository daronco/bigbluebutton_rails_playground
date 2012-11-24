require 'spec_helper'

describe LocalesController do
  render_views

  pending "#set"

  context "can be accessed by non-members" do
    it { should_not require_authentication_for(:set, { :id => "en" }) }
  end

  describe "abilities:" do
    context "a superuser" do
      login_superuser
      it { should_not deny_access_to(:set, { :id => "en" }) }
    end

    context "a normal user" do
      login_user
      it { should_not deny_access_to(:set, { :id => "en" }) }
    end

    context "an anonymous user" do
      it { should_not deny_access_to(:set, { :id => "en" }) }
    end
  end

end
