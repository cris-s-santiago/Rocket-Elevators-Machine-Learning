class AddEmployeeId < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :user_id, :string
  end
end
