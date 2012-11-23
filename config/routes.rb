BigbluebuttonRailsPlayground::Application.routes.draw do

  get "home", :to => "home#index", :as => "home"
  root :to => "home#index"

  # Set locale
  match "locale/set/:id", :to => "locales#set", :as => "set_locale"

  # Devise
  # controllers = { :sessions => "sessions", :registrations => "registrations" }
  paths = { :sign_in => "login", :sign_out => "logout", :sign_up => "signup" }
  devise_for :users, :path_names => paths #, :controllers => controllers
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "logout", :to => "devise/sessions#destroy"
    get "register", :to => "devise/registrations#new"
  end

  # bigbluebutton_rails routes
  controllers = { :servers => "webconf_servers", :rooms => "webconf_rooms" }
  bigbluebutton_routes :default, :scope => "webconf",
                                 :controllers => controllers,
                                 :as => "bigbluebutton"

  # The unique Site is created in db/seeds and can only be edited
  resource :site, :only => [:show, :edit, :update]

  # Provider stuff
  get "/auth/mconf_id/authorize" => "oauth#authorize"
  post "/auth/mconf_id/access_token" => "oauth#access_token"
  get "/auth/mconf_id/user" => "oauth#user"
  post "/oauth/token" => "oauth#access_token"

end
