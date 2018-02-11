Rails.application.routes.draw do
  resources :messages
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :beacons
    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
