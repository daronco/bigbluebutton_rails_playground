require 'spec_helper'

describe LocalesController do
  describe "routing" do
    it { should route(:get, "/locale/set/en").to(:action => :set, :id => "en") }
  end

  context "route helpers" do
    it { set_locale_path(:en).should == "/locale/set/en" }
  end
end
