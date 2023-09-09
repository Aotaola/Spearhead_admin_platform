Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :edit, :new, :create, :update, :destroy]
  resources :admins, only: [:show, :edit, :new, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  
end
