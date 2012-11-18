require 'spec_helper'

describe LocalesController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/locale/set/en").to(:action => :set, :id => "en") }

    context "route helpers" do
      it { set_locale_path(:en).should == "/locale/set/en" }
    end
  end

end
