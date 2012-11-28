require 'spec_helper'

describe SitesController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/manage/site").to(:action => :show) }
    it { should route(:put, "/manage/site").to(:action => :update) }
    it { should route(:get, "/manage/site/edit").to(:action => :edit) }

    context "route helpers" do
      it { site_path().should == "/manage/site" }
      it { edit_site_path().should == "/manage/site/edit" }
    end
  end

end
