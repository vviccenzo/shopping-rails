Rails.application.routes.draw do
  post "produtos", to: "produtos"
  root to: "produtos#index"
  get "produtos/new", to:"produtos#new"
end
