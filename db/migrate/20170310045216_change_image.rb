class ChangeImage < ActiveRecord::Migration[5.0]
  def change
  	rename_column :products, :image, :description
  end
end
