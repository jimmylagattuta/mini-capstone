class ProductsControllerController < ApplicationController    #generate controller for Image, new and create. make new and create views
	before_action :authenticate_user!, except: [:index, :show, :search]
	before_action :authenticate_admin!, except: [:index, :show, :search]

	def show

		if params[:id] == "random"
		#random from database
			products = Product.all
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
		small = params[:small]

		if size
			@products = Product.where("weight > ?", 20)
		elsif small
			@products = Product.where("weight < ?", 20)
		elsif small && sort_order
			@products = Product.all.order(sort => sort_order)
		elsif sort && sort_order
			@products = Product.all.order(sort => sort_order)
		else
			@products = Product.all
		end

		if session[:count]
			session[:count] += 1
		else
			session[:count] = 0
		end

		@visit_count = session[:count]

		@category_id = params[:category_id]
		@categories = Category.all
		if @category_id
			puts "category found"
			puts @category_id
			@category = Category.find_by(id: @category_id)
			puts "*" * 100
			puts @category
			puts "*" * 100
			@products = @category.products
			puts "*" * 100
			puts @product
		else
			puts "categry not found"
			@products = Product.all
		end
	end

	def new #no code needed
	end

	def create
		input_name = params[:product_name]
		input_price = params[:product_price].to_i
		input_description = params[:product_description]
		#input_image = params[:product_image] <image: input_image, deleted from @product_add, image deleted from new and edit pages, model image made
		input_stock = params[:product_stock]
		input_weight = params[:product_weight]
		input_supplier_id = params[:product_supplier_id]
		input_user_id = params[:product_user_id]
		@product_add = Product.create(name: input_name, price: input_price, description: input_description, stock: input_stock, weight: input_weight, supplier_id: input_supplier_id, user_id: input_user_id)
	

		flash[:info] = "Pet Successfully Added"
		redirect_to "/products/#{@product_add.id}"
	end

	def search
		search_term = params[:search_term]

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
		#@product.image = params[:product_image]
		@product.stock = params[:product_stock]
		@product.weight = params[:product_weight]
		@product.supplier_id = params[:product_supplier_id]
		@product.user_id = params[:product_user_id]
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
