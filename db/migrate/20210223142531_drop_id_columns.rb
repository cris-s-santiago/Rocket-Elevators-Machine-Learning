class DropIdColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :elevators, :column_id
    remove_column :columns, :battery_id
    remove_column :batteries, :building_id
    remove_column :building_details, :building_id
    remove_column :buildings, :customer_id
    remove_column :employees, :user_id
    remove_column :users, :role_id
    remove_column :quotes, :user_id
    remove_column :customers, :user_id
    # remove_column :addresses, :building_id
  end
end
