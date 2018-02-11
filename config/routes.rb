Rails.application.routes.draw do
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :beacons
    resources :messages
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
