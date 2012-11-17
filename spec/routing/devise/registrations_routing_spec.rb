require "spec_helper"

describe Devise::RegistrationsController do
  include Shoulda::Matchers::ActionController

  describe "routing" do
    it { {:get => "/register"}.should route_to(:controller => "devise/registrations", :action => "new") }
    it { should route(:get, "/users/signup").to(:action => :new) }
  end
end
