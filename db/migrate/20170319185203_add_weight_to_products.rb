class AddWeightToProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :weight, :integer
  end
end
