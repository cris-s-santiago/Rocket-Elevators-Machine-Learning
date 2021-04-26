class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.bigint :column_id
      t.bigint :serial_number
      t.string :model_type
      t.string :building_type
      t.string :status
      t.datetime :date_of_commissioning
      t.datetime :date_of_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.string :notes

      t.timestamps null: false

    end
  end
end
