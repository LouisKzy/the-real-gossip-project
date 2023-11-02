Rails.application.routes.draw do

  get 'cities/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get 'team' => 'static#team'
  get 'contact' => 'static#contact'
  get 'welcome/:first_name', to: 'static#show', as: :welcome
  resources :gossips
  resources :users
  resources :cities, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'gossips#index'
end
