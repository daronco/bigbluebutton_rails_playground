require 'spec_helper'

describe ApplicationController do
  describe "routing" do
    it { {:get => "/"}.should route_to(:controller => "home", :action => "show") }
  end

  context "route helpers" do
    it { root_path.should == "/" }
  end
end
