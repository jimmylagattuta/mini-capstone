Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "products_controller#index"
  #get "/new_product" => "products_controller#new_product"
  #post "/new_product" => "products_controller#create_product"
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

  #Supplier routes
  get "/suppliers" => "supply#index"
  get "/suppliers/new" => "supply#new"
  post "/suppliers" => "supply#create"
  get "/suppliers/:id" => "supply#show"
  get "/suppliers/:id/edit" => "supply#edit"
  patch "/suppliers/:id" => "supply#update"
  delete "/suppliers/:id" => "supply#destroy"

#Image Routs
  get "/products/:product_id/images/new" => "images#new"     #<ties form to product, you dont have to type in product id each time
  post "/products/:product_id/images" => "images#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  post "/orders" => "orders#create"
  get "orders/:id" => "orders#show"


  get "/cartedproducts" => "carted_products#index"
  post "/cartedproducts" => "carted_products#create"
  get "/cartedproducts" => "carted_products#show"
  patch "cartedproducts/:id" => "carted_products#update"

end