class CartedProductsController < ApplicationController
	before_action :authenticate_user! 
	
	def index 
		@carted_products = current_user.carted_products.where(status: "carted")	
			if @carted_products.empty?
				flash[:danger] = "Cannot View Empty Cart"
				redirect_to "/products"
			end
	end


	def new
	end

	def create
		user_id = current_user.id
		product_id = params[:product_id]
		quantity = params[:quantity].to_i
		product = Product.find_by(id: product_id)
		if quantity == 0 
			flash[:danger] = "Cannot Add Zero to Cart"
			redirect_to "/products/#{product_id}"
		else	
			@cart = CartedProduct.new(user_id: user_id, 
								      product_id: product_id, 
								      quantity: quantity, 
								      status: "carted")

			product.stock_subtract
			if @cart.save
				flash[:success] = "Product Added to Cart"
				redirect_to "/cartedproducts"
			else
				flash[:danger] = "There was a problem"
				redirect_to "/products/#{product_id}"
			end
		end
	end

	def show
	end

	def update #find the carted_product in the table, change its status to removed
		#product = CartedProduct.find_by(id: params[:id])
		@carted_products = CartedProduct.find_by(id: params[:id])
		product_id = params[:product_id]
		product = Product.find_by(id: product_id)
		@carted_products.status = "Removed"
		@carted_products.save
		product.stock_subtract
		flash[:info] = "#{@carted_products.product.name} has been removed from your cart"
		redirect_to "/cartedproducts"

	end
end
