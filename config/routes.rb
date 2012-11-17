BigbluebuttonRailsPlayground::Application.routes.draw do

  get "home/index"

  # devise
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

  resources :users do
    get :new_room, :to => "webconf_rooms#user_new", :as => "new_room"
  end

  root :to => "home#index"

end
