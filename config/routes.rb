Rails.application.routes.draw do
  root "main#index"

  get  "/admin",     to: "sessions#new"
  post "/admin",     to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"

  get "/about",      to: "about#index"
  get "/store",      to: "items#index"

  resources :items, only: [:new, :create, :show, :edit, :update]

  post "/cart_items", to: "cart_items#create"
  get "/cart",        to: "cart_items#index"
  delete '/cart_items', to: "cart_items#destroy"
  put '/cart_items', to: "cart_items#update"
end
