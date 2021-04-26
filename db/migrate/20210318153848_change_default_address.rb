class ChangeDefaultAddress < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:addresses, :suite, ' ')
  end
end
