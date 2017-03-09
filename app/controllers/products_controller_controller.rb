class ProductsControllerController < ApplicationController
	def view_products_method
		@products = "Some products"
		render 'products.html.erb'
	end
end
