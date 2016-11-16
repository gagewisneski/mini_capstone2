Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "products#home"

  get "/new_product", to: "products#new_product"
  post "/create_product", to: "products#create_product"

  get "/products", to: "products#index"

  #to edit a product
  get "/products/:id/edit", to: "products#edit"
  patch "/products/:id", to: "products#update"

  delete "/products/:id", to: "products#destroy"

  #make sure routes aren't overriden
  get "/products/:id", to: "products#show"

end
