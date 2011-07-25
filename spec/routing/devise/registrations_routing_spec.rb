require "spec_helper"

describe Devise::RegistrationsController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { should route(:get, "/register").to(:action => :new) }

    # TODO: disable the standard devise routes for sessions
    # it { should_not route(:get, "/users/sign_up").to(:action => :new) }
  end
end
