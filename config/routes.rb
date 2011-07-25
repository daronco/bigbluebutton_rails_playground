BigbluebuttonRailsPlayground::Application.routes.draw do

  get "home/index"

  devise_for :users, :skip => [:sessions] do
    get "/login" => "devise/sessions#new"
    post "/login" => "devise/sessions#create"
    get "/logout" => "devise/sessions#destroy"
    get "/register" => "devise/registrations#new"
  end

  bigbluebutton_routes :default, :controllers => { :servers => 'custom_servers', :rooms => 'custom_rooms' }

  resources :users do
    get :new_room, :to => 'custom_rooms#user_new', :as => 'new_room'
    bigbluebutton_routes :room_matchers
  end

  root :to => 'home#index'

end
