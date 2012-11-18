require 'spec_helper'

describe ApplicationController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { {:get => "/"}.should route_to(:controller => "home", :action => "index") }

    context "route helpers" do
      it { root_path.should == "/" }
    end
  end

end
