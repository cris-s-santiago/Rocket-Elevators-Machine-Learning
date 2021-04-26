class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.bigint :user_id, null: false
      t.datetime :created_at, null: false
      t.string :company_name, null: false
      t.string :company_address
      t.string :company_contact_full_name, null: false
      t.string :company_phone, null: false
      t.string :company_email, null: false
      t.string :company_description, null: false
      t.string :service_technical_authority_full_name, null: false
      t.string :service_technical_authority_phone, null: false
      t.string :service_technical_authority_email, null: false

      t.timestamps null: false
    end
  end
end
