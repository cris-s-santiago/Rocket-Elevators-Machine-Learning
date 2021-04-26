class AddRoleIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :string
    change_column_default(:users, :role_id, 'User')
  end
end
