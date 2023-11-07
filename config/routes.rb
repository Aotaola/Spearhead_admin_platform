Rails.application.routes.draw do
  resources :invoices
  resources :patients
  resources :services
  resources :logs
  resources :articles
  resources :admins
  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]
      resources :services, only: [:index, :show]
      resources :patients, only: [:index, :show]
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get 'patient_login', to: 'patient_sessions#new'
  post 'patient_login', to: 'patient_sessions#create'
  delete 'patient_logout', to: 'patient_sessions#destroy'
 
end
