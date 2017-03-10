class ProductsControllerController < ApplicationController
	def view_products_method
		@products = "Some products"
		render 'products.html.erb'
	end

	def new_product
	end

	def create_product
		input_name = params[:product_name]
		input_price = params[:product_price]
		input_description = params[:product_description]
		@product_add = Product.create(name: input_name, price: input_price, description: input_description)
	end
end
