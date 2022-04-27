Rails.application.routes.draw do
  delete "produtos/:id", to: "produtos#destroy", as: :produto

  post "produtos", to: "produtos#create"

  root to: "produtos#index"

  get "produtos/new", to:"produtos#new"
  
end
