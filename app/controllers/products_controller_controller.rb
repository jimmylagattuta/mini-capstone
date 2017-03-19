class ProductsControllerController < ApplicationController
	def show

		if params[:id] == "random"
		#random from database
			@products = Product.all
			@product = products.sample
		else
			product_id = params[:id]
			@product = Product.find_by(id: product_id)
		end
	end

	def index
		sort = params[:sort]
		sort_order = params[:sort_order]
		size = params[:size]

		if size
			@products = Product.where("weight > ?", 20)
		elsif sort && sort_order
			@products = Product.all.order(sort => sort_order)
		else
			@products = Product.all
		end
	end

	def new #no code needed
	end

	def create
		input_name = params[:product_name]
		input_price = params[:product_price].to_i
		input_description = params[:product_description]
		input_image = params[:product_image]
		input_stock = params[:product_stock]
		input_weight = params[:product_weight]
		@product_add = Product.create(name: input_name, price: input_price, description: input_description, image: input_image, stock: input_stock, weight: input_weight)
		flash[:info] = "Pet Successfully Added"
		redirect_to "/products/#{@product_add.id}"
	end

	def search
		params[:search_term]
		@products = Product.where("name ILIKE ?", "%#{search_term}%")
		render :index
	end

	def edit
		product_id = params[:id]
		@product = Product.find_by(id: product_id)
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
		@product.stock = params[:product_stock]
		@product.weight = params[:product_weight]
		@product.save

		flash[:success] = "Pet successfully updated"

		redirect_to "/products/#{@product.id}"
	end

	def destroy
		@product = Product.find_by(id: params[:id])
		
		@product.stock = @product.stock - 1

		flash[:success] = @product.out_of_stock

		flash[:info] = "Pet Adoption total plus donation: $" + @product.adoption_donation.to_s

		flash[:danger] = "Pet Adopted"

		@product.delete
		redirect_to "/products"
	end

	#def create_product
	#	input_name = params[:product_name]
	#	input_description = params[:product_description]
	#	@product_add = Product.create(name: input_name, price: input_price, description: input_description)
	#end
end
