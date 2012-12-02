require 'spec_helper'

describe ProfilesController do
  describe "routing" do
    it { should route(:put, "/users/profile").to(:action => :update) }
  end

  context "route helpers" do
    it { profile_path().should == "/users/profile" }
  end
end
