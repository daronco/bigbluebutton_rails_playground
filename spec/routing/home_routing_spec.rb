require 'spec_helper'

describe HomeController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/home").to(:action => :show) }

    context "route helpers" do
      it { home_path.should == "/home" }
    end
  end

end
