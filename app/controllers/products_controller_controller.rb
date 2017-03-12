class ProductsControllerController < ApplicationController
	def show
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
	end

	def index
		@products = Product.all
	end

	def new #no code needed
	end

	def create
		input_name = params[:product_name]
		input_price = params[:product_price].to_i
		input_description = params[:product_description]
		input_image = params[:product_image]
		@product_add = Product.create(name: input_name, price: input_price, description: input_description, image: input_image)
	end

	def edit
		recipe_id = params[:id]
		@product = Product.find_by(id: recipe_id)
	end

	def update
	#	input_name = params[:product_name]
	#	input_price = params[:product_price]
	#	input_description = params[:product_description]


		@product = Product.find_by(id: params[:id])
		@product.name = params[:product_name]
		@product.price = params[:product_price]
		@product.description = params[:product_description]
		@product.image = params[:product_image]
		@product.save

		redirect_to "/products/#{@product.id}"
	end

	def destroy
		@product = Product.find_by(id: params[:id])
		@product.destroy
		redirect_to "/products"
	end

	#def create_product
	#	input_name = params[:product_name]
	#	input_description = params[:product_description]
	#	@product_add = Product.create(name: input_name, price: input_price, description: input_description)
	#end
end
