Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "products#home"

  get "/new_product", to: "products#new_product"
  post "/create_product", to: "products#create_product"

  get "/products", to: "products#index"


  #make sure routes aren't overriden
  get "/products/:id", to: "products#show"

end
