require 'spec_helper'

describe UsersController do
  describe "routing" do
    it { should route(:get, "/users/u1").to(:action => :show, :id => "u1") }
  end

  context "route helpers" do
    let(:user) { FactoryGirl.create(:user) }
    it { user_path(user).should == "/users/#{user.to_param}" }
  end
end
