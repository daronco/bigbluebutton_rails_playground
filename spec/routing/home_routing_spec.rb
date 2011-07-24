require 'spec_helper'

describe HomeController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    pending { should route(:get, "/").to(:action => :index) }
    it { should route(:get, "/home/index").to(:action => :index) }
  end

end

