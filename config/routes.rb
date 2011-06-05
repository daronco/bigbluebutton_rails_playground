BigbluebuttonRailsPlayground::Application.routes.draw do

  get "home/index"

  devise_for :users

  bigbluebutton_routes :default, :controllers => { :servers => 'custom_servers', :rooms => 'custom_rooms' }

  resources :users do
    get :new_room, :to => 'custom_rooms#user_new', :as => 'new_room'

    bigbluebutton_routes :room_matchers
    resources :spaces do
      bigbluebutton_routes :room_matchers
    end
  end

  root :to => 'home#index'

end
