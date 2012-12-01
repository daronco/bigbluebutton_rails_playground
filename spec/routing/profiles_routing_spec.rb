require 'spec_helper'

describe ProfilesController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:put, "/users/profile").to(:action => :update) }

    context "route helpers" do
      it { profile_path().should == "/users/profile" }
    end
  end

end
