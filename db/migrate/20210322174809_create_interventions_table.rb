class CreateInterventionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.bigint :author
      t.bigint :customer_id, null: false
      t.bigint :building_id, null: false
      t.bigint :battery_id
      t.bigint :column_id
      t.bigint :elevator_id 
      t.bigint :employee_id
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :result, :default => 'Incomplete'
      t.string :report 
      t.string :status, :default => 'Pending'

    end
    add_index :interventions, :author
  end
end

