Rails.application.routes.draw do
  # resources :users
  resources :plants

  resources :gardens do
    resources :plants
  end


  resources :users do
    resources :gardens
    resources :plants
  end


  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  get '/', to: "welcome#home"

end
