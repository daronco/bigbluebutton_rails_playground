BigbluebuttonRailsPlayground::Application.routes.draw do

  get "home/index"

  devise_for :users

  bigbluebutton_routes :default

  resources :users do
    bigbluebutton_routes :room_matchers
    resources :spaces do
      bigbluebutton_routes :room_matchers
    end
  end

  root :to => 'home#index'

end
