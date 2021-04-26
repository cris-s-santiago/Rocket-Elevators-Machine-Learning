class ChangeDefaultQuotes < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:quotes, :name, ' ')
    change_column_default(:quotes, :building_type, ' ')
    change_column_default(:quotes, :number_of_apartments, 0)
    change_column_default(:quotes, :number_of_floors, 0)
    change_column_default(:quotes, :number_of_basements, 0)
    change_column_default(:quotes, :number_of_companies, 0)
    change_column_default(:quotes, :number_of_parking_spots, 0)
    change_column_default(:quotes, :number_of_elevators, 0)
    change_column_default(:quotes, :number_of_corporations, 0)
    change_column_default(:quotes, :maximum_occupancy, 0)
    change_column_default(:quotes, :product_line, ' ')
    change_column_default(:quotes, :elevator_unit_price, 0)
    change_column_default(:quotes, :elevator_total_price, 0)
    change_column_default(:quotes, :installation_price, 0)
    change_column_default(:quotes, :total_price, 0)
    change_column_default(:quotes, :company_name, ' ')
    change_column_default(:quotes, :business_hours, 0)
    change_column_default(:quotes, :email, ' ')
  end
end