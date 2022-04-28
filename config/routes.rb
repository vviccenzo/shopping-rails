Rails.application.routes.draw do
  resources :setors
  resources :departamentos
  #Ele vai buscar em produtos a url busca, no controller produtos e usar o método busca
  get "produtos/busca", to: "produtos#busca", as: :busca_produto
  resources :produtos, only: [:new, :destroy, :create]
  root to: "produtos#index"
end
