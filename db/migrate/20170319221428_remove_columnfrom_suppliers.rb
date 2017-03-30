class RemoveColumnfromSuppliers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :suppliers, :supplier_id, :integer
  end
end
