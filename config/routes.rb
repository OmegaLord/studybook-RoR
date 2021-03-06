Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_station, on: :member
    end
    resources :routes
    resources :tickets
    get 'welcome/index'
  end

  resource :search, only: [:show]
  resources :tickets

  root 'searches#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
