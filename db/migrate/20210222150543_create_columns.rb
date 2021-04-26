class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.bigint :battery_id
      t.string :building_type
      t.integer :number_of_floors_served
      t.string :status
      t.string :information
      t.string :notes

      t.timestamps null: false
    end
  end
end
