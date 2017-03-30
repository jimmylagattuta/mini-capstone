class AddUsertoProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :subtotal, :decimal, precision: 9, scale:2
  	change_column :products, :tax, :decimal, precision: 9, scale:2
  	change_column :products, :total, :decimal, precision: 9, scale:2
  end
end
