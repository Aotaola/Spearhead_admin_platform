Rails.application.routes.draw do
  resources :services
  resources :logs
  resources :articles
  resources :admins
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]
      resources :services, only: [:index, :show]
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
 

  
end
