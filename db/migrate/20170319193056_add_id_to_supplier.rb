class AddIdToSupplier < ActiveRecord::Migration[5.0]
  def change
  	add_column :suppliers, :supplier_id, :integer
  end
end
