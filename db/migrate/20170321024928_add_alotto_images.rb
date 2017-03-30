class AddAlottoImages < ActiveRecord::Migration[5.0]
  def change
  	rename_column :images, :photo_one, :photo
  	remove_column :images, :photo_two, :integer
  	remove_column :images, :photo_three, :integer
  	remove_column :images, :photo_four, :integer
  	remove_column :images, :photo_five, :integer
  	add_column :images, :product_id, :integer
  end
end
