Rails.application.routes.draw do
  resources :requests
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :beacons
    resources :messages do
      collection do
        get "talk/:username", to: "messages#talk"
      end
    end

    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
