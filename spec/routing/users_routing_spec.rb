require 'spec_helper'

describe UsersController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/users/u1").to(:action => :show, :id => "u1") }

    context "route helpers" do
      let(:user) { FactoryGirl.create(:user) }
      it { user_path(user).should == "/users/#{user.to_param}" }
    end
  end

end
