require "spec_helper"

describe Devise::SessionsController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/login").to(:action => :new) }
    it { should route(:post, "/login").to(:action => :create) }
    it { should route(:get, "/logout").to(:action => :destroy) }

    # TODO: disable the standard devise routes for sessions
    # it { should_not route(:get, "/users/sign_in").to(:action => :new) }
    # it { should_not route(:post, "/users/sign_in").to(:action => :create) }
    # it { should_not route(:get, "/users/sign_out").to(:action => :destroy) }
  end
end
