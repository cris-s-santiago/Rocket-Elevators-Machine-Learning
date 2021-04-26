class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name, null: false
      t.string :company_name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :project_name, null: false
      t.string :project_description, null: false
      t.string :department_in_charge_of_the_elevators
      t.string :message, null: false
      t.string :file_name
      t.string :file_type
      t.binary :file_data
      t.datetime :created_at, null: false

      t.timestamps null: false
    end
  end
end
