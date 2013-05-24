class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :item_type
      t.float :price

      t.timestamps
    end
	add_index :products, :name # Add index to name attibute
	add_index  :products, :item_type	   # Add index to product attribute
  end
end
