class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_type
      t.string :status
      t.string :notes
      t.string :entity

      t.address :address
      t.timestamps null: false
    end
  end
end
