class CreatePersonalDetails < ActiveRecord::Migration
  def change
    create_table :personal_details do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.string :citizenship
      t.string :civil_status
      t.string :medications
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :address_state
      t.string :address_country
      t.string :address_post_code
      t.string :email
      t.string :home_phone
      t.string :cell_phone

      t.timestamps
    end
  end
end
