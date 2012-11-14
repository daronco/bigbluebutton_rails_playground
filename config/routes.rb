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

  # bigbluebutton_rails default routes
  bigbluebutton_routes :default, :controllers => { :servers => 'custom_servers', :rooms => 'custom_rooms' }

  resources :users do
    get :new_room, :to => 'custom_rooms#user_new', :as => 'new_room'
    bigbluebutton_routes :room_matchers
  end

  root :to => "home#index"

end
