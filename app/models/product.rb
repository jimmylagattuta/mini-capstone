class Product < ApplicationRecord
	
	belongs_to :supplier
	has_many :images

	has_many :categorized_products
	has_many :categories, through: :categorized_products
	has_many :carted_products
	has_many :orders, through: :carted_products 

	

	#def supplier
	#	Supplier.find_by(id: supplier_id)

	def description_split
		description.split(", ")
	end

	def sale_messege
		if price > 100
			"Special Extra Large Breed"
		elsif price < 100
			"Chihuahua Mix"
		end
	end

	def adoption_donation
		tax = 0.09
		donation = price * (1 + tax)
		donation
	end

	def stock_of_breed
		if stock == 0
			stock_messege = "#{name} is now out of stock" 
		else
			"We have " + stock.to_s + " #{name}'s available for adopion."
		end
	end

	def stock_subtract(quantity)
		if stock > 0
			stock = stock - quantity
		end
	end

	def outofstock
		flash[:danger] = "Sorry we are out of stock"
		redirect_to "/products/show"
	end
	
end