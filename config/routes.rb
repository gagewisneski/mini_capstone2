Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "products#index"
  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"

  #to edit a product
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  #make sure routes aren't overriden
  get "/products/:id", to: "products#show"

  get "/products/:id/confirmation", to: "products#confirmation"

  post "/products/search", to: "products#search"




  get "/suppliers", to: "suppliers#index"

  get "/suppliers/new", to: "suppliers#new"
  post "/suppliers", to: "suppliers#create"

  get "/suppliers/:id", to: "suppliers#show"

  get "/suppliers/:id/edit", to: "suppliers#edit"
  patch "/suppliers/:id", to: "suppliers#update"

  delete "/suppliers/:id", to: "suppliers#destroy"

  get "/suppliers/:id/confirmation", to: "suppliers#confirmation"


end
