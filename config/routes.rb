Rails.application.routes.draw do
  devise_for :users

  namespace :v1, defaults: { format: :json } do
    resources :beacons
    resources :requests do
      member do
        post "accept"
      end
    end
    resources :messages do
      collection do
        get "talk/:username", to: "messages#talk"
      end
    end

    resource :login, only: [:create], controller: :sessions
    resource :users, only: [:create]
  end
end
