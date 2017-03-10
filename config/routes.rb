Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/products" => "products_controller#view_products_method"
  get "/new_product" => "products_controller#new_product"
  post "/new_product" => "products_controller#create_product"

end
