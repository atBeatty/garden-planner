Rails.application.routes.draw do
  resources :users
  resources :plants
  resources :gardens

  # resources :users do
  #   resources :plants 
  # end


  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get '/', to: "welcome#home"

end
