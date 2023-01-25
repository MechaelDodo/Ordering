Rails.application.routes.draw do
  #resources :orders
  get "/", to: "orders#new"
  post "/create", to: "orders#create"
  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show"
  #get '/dishes/[:id]', to: 'dishes#show'
  resources :dishes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
