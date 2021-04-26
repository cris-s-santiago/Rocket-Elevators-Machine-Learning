class AddEmployeeIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employee_id, :string
    # add_reference :employees, :users, index: true
  end
end
