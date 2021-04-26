# class FixQuoteNames < ActiveRecord::Migration[5.2]
#   def change
#     change_table :table_name do |t|
#       t.rename :old_column1, :new_column1
#       t.rename :old_column2, :new_column2
#       ...
#     end
#   end
# end

class FixQuoteNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :quotes, :type, :building_type
    rename_column :quotes, :apartments, :number_of_apartments
    rename_column :quotes, :floors, :number_of_floors
    rename_column :quotes, :basements, :number_of_basements
    rename_column :quotes, :companies, :number_of_companies
    rename_column :quotes, :parkings, :number_of_parking_spots
    rename_column :quotes, :elevators, :number_of_elevators
    rename_column :quotes, :corporation, :number_of_corporations
    rename_column :quotes, :occupants, :maximum_occupancy
    rename_column :quotes, :hours, :business_hours
    rename_column :quotes, :elevator_total_cost, :elevator_total_price
    rename_column :quotes, :installation_cost, :installation_price
    rename_column :quotes, :total_cost, :total_price
  end
end

# create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
#   t.string "name"
#   t.string "type"
#   t.integer "apartments"
#   t.integer "floors"
#   t.integer "basements"
#   t.integer "companies"
#   t.integer "parkings"
#   t.integer "elevators"
#   t.integer "corporation"
#   t.integer "occupants"
#   t.string "product_line"
#   t.float "elevator_unit_price"
#   t.float "elevator_total_cost"
#   t.float "installation_cost"
#   t.float "total_cost"
#   t.string "company_name"
#   t.time "hours"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["name"], name: "index_quotes_on_name"
# end
