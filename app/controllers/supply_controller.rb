class SupplyController < ApplicationController
	
	def new
	end

	def create
		input_name = params[:supplier_name]
		input_email = params[:supplier_email]
		input_phone = params[:supplier_phone]
		@supplier_add = Supplier.create(name: input_name, email: input_email, phone: input_phone)
		redirect_to "/suppliers/#{@supplier_add.id}"
	end

	def show
		supplier_id = params[:id]
		@supplier = Supplier.find_by(id: supplier_id)
	end

	def index
		@suppliers = Supplier.all
	end

	def edit
		supplier_id = params[:id]
		@supplier = Supplier.find_by(id: supplier_id)
	end

	def update
		@supplier = Supplier.find_by(id: params[:id])
		@supplier.name = params[:product_name]
		@supplier.email = params[:supplier_email]
		@supplier.phone = params[:supplier_phone]
		@supplier.save
		redirect_to "/suppliers/#{@supplier.id}"

	end

	def destroy
		@supplier = Supplier.find_by(id: params[:id])
		@supplier.delete
		redirect_to "/suppliers"
	end


end
