class ChangeDefaultRole < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :role_id, 1)
  end
end
