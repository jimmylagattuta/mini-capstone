Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/new_product" => "products_controller#new_product"
  post "/new_product" => "products_controller#create_product"
# Restful routes
  get "/products" => "products_controller#index"
  get "/products/new" => "products_controller#new"
  # must get to products below, no same name complications
  post "/products" => "products_controller#create"
  #wildcards will take any parameter, very helpful to put at end of routes
  get "/products/:id" => "products_controller#show"
  
  #Edit and update
  get "/products/:id/edit" => "products_controller#edit"
  patch "/products/:id" => "products_controller#update"

  delete "/products/:id" => "products_controller#destroy"

  post "/search" => "products_controller#search"

end