Rails.application.routes.draw do
  root "main#index"

  get  "/admin",     to: "sessions#new"
  post "/admin",     to: "sessions#create"
  get  "/dashboard", to: "admin#show", as: :dashboard
  delete "/logout",  to: "sessions#destroy"
end
