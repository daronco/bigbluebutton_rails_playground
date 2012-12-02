require "spec_helper"

describe Devise::RegistrationsController do
  describe "routing" do
    it { {:get => "/register"}.should route_to(:controller => "devise/registrations", :action => "new") }
    it { should route(:get, "/users/signup").to(:action => :new) }
  end
end
