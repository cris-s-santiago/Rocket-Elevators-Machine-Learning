class UpdateAddressTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :address_formatted_address
    remove_column :addresses, :address_street_number
    remove_column :addresses, :address_street_name
    remove_column :addresses, :address_street
    remove_column :addresses, :address_city
    remove_column :addresses, :address_zip_code
    remove_column :addresses, :address_department
    remove_column :addresses, :address_department_code
    remove_column :addresses, :address_state
    remove_column :addresses, :address_state_code
    remove_column :addresses, :address_country
    remove_column :addresses, :address_country_code
    remove_column :addresses, :address_lat
    remove_column :addresses, :address_lng
    add_column :addresses, :number_and_street, :string
    add_column :addresses, :suite, :string
    add_column :addresses, :city, :string
    add_column :addresses, :postal_code, :string
    add_column :addresses, :country, :string
  end
end