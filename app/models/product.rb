class Product < ApplicationRecord
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

	def out_of_stock
		if stock == 0
			stock_messege = "#{name} is now out of stock" 
		end
	end
end
