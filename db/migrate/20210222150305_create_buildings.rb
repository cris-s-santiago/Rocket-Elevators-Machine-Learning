class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.bigint :customer_id, null: false
      t.string :building_address

      t.string :building_admin_full_name, null: false
      t.string :building_admin_email, null: false
      t.string :building_admin_phone, null: false

      t.string :building_technical_full_name, null: false
      t.string :building_technical_email, null: false
      t.string :building_technical_phone, null: false

    end
  end
end
