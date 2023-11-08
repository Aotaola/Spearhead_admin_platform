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
      resources :patients, only: [:index, :show, :create, :update, :destroy]
      get 'patient_login', to: 'patient_session#new'
      post 'patient_login', to: 'patient_session#create'
      delete 'patient_logout', to: 'patient_session#destroy'
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  

 
end
