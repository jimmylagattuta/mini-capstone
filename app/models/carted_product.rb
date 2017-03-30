class CartedProduct < ApplicationRecord
	belongs_to :user
	belongs_to :product
	belongs_to :order, optional: true

	def stock_subtract(quantity)
		if stock > 0
			stock = stock - quantity
		end
	end

end
