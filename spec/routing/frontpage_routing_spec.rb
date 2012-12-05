require 'spec_helper'

describe FrontpageController do
  describe "routing" do
    it { {:get => "/"}.should route_to(:controller => "frontpage", :action => "show") }
  end

  context "route helpers" do
    it { root_path.should == "/" }
  end
end
