Rails.application.routes.draw do
  namespace :admin do
    resources :drinks
    resources :users
  end

  namespace :user do
    get "profile", to: "profiles#profile"
    patch "profile", to: "profiles#update"
    resources :summary, only: [:index]
    resources :user_drinks, as: :records
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  post   "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "up" => "rails/health#show", as: :rails_health_check
end
