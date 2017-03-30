class ImagesController < ApplicationController

	def new
		@product = Product.find_by(id: params[:product_id])
	end

	def create
		@product = Product.find_by(id: params[:product_id])
		input_url = params[:product_image]

		@image_add = Image.create(photo: input_url, product_id: @product.id)

		redirect_to "/products/#{@product.id}"
	end


end
