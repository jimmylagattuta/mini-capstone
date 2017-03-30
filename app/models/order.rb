class Order < ApplicationRecord
	belongs_to :user
	has_many :products, through: :carted_products
	has_many :carted_products


	def adoption_donation_main
		subtotal = product.price * quantity
		tax = product.price * 0.09
		total = subtotal + tax
		"And the comes out to your total of $" + total.to_s
	end

	def adoption_donation_subtotal
		subtotal = product.price * quantity
		"Your subtotal is $" + subtotal.to_s
	end

	def adoption_donation_tax
		tax = product.price * 0.09
		"Your tax is $" + tax.to_s
	end

	def stock_of_breed
		if product.stock == 0
			stock_messege = "#{product.name} is now out of stock" 
		else
			product.stock = product.stock - quantity
			product.save
			"We now have " + product.stock.to_s + " #{product.name}'s available for adopion."
		
		end
	end

end

