##db create quotes

class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :name
      t.string :type
      t.integer :apartments
      t.integer :floors
      t.integer :basements
      t.integer :companies
      t.integer :parkings
      t.integer :elevators
      t.integer :corporation
      t.integer :occupants
      t.string :product_line
      t.float :elevator_unit_price
      t.float :elevator_total_cost
      t.float :installation_cost
      t.float :total_cost
      t.string :company_name
      t.time :hours

      t.timestamps
    end
    add_index :quotes, :name
  end
end
