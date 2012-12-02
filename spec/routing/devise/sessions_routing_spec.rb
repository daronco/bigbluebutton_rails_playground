require "spec_helper"

describe Devise::SessionsController do
  describe "routing" do
    it { {:get => "/login"}.should route_to(:controller => "devise/sessions", :action => "new") }
    it { should route(:get, "/users/login").to(:action => :new) }
    it { should route(:post, "/users/login").to(:action => :create) }
    it { should route(:delete, "/users/logout").to(:action => :destroy) }
  end
end
