require 'spec_helper'

describe SitesController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/site").to(:action => :show) }
    it { should route(:put, "/site").to(:action => :update) }
    it { should route(:get, "/site/edit").to(:action => :edit) }

    context "route helpers" do
      it { site_path().should == "/site" }
      it { edit_site_path().should == "/site/edit" }
    end
  end

end
