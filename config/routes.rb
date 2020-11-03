Rails.application.routes.draw do
  resources :users
  

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  root to: "welcome#home"

end
