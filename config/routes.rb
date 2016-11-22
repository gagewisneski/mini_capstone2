Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "products#index"
  get "/products", to: "products#index"

  get "/products/new", to: "products#new"
  post "/products", to: "products#create"

  get "/products/search", to: "products#search"

  #to edit a product
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  #make sure routes aren't overriden
  get "/products/:id", to: "products#show"

  get "/products/:id/confirmation", to: "products#confirmation"



end
