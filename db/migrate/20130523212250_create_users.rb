class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
	  
      t.timestamps
    end
	add_index :users, :email, unique: true # Add index to email attibute
	add_index  :users, :remember_token	   # Add index to remember_token attribute
  end
end
