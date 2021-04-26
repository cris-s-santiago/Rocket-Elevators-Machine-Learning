class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      t.bigint :building_id, null: false
      t.string :information_key, null: false
      t.string :information_value, null: false
    end
  end
end
