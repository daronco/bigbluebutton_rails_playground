require 'spec_helper'

describe HomeController do
  describe "routing" do
    it { should route(:get, "/home").to(:action => :show) }
  end

  context "route helpers" do
    it { home_path.should == "/home" }
  end
end
