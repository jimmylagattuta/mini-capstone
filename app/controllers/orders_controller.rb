class OrdersController < ApplicationController
	before_action :authenticate_user! 
	
	def new
	end

	def create
		# product = Product.find_by(id: params[:product_id])
		# input_subtotal = product.price * params[:quantity].to_i
		# input_tax = product.price * 0.09
		# input_total = input_subtotal + input_tax
		# order = Order.create(user_id: current_user.id, 
		# 					 subtotal: input_subtotal, 
		# 					 tax: input_tax, 
		# 					 total: input_total)

		# redirect_to "/orders/#{order.id}"


		user_carted_products = CartedProduct.where(user_id: current_user.id, 
												   status: "carted")
		subtotal = 0
		user_carted_products.each do |carted_product|

			subtotal += (carted_product.quantity * carted_product.product.price)

		
		end

		tax = subtotal * 0.09
		total = subtotal + tax
		order = Order.create(user_id: current_user.id, 
							 subtotal: subtotal,
							 tax: tax,
							 total: total)
		user_carted_products.each do |carted_product|
			carted_product.status = "Purchased"
			carted_product.order_id = order.id
			carted_product.save
		end

		redirect_to "/orders/#{order.id}" 


	end

	def show
		#@user = User.find_by(id: params[:id])
		@order = Order.find_by(id: params[:id])
		@order.carted_products 
		
	end

end
