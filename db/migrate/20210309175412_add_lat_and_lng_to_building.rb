class AddLatAndLngToBuilding < ActiveRecord::Migration[5.2]
  def change
    add_column :buildings, :longitude, :string
    add_column :buildings, :latitude, :string
  end
end
