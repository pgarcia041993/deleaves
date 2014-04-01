class CreateSupplementalDetails < ActiveRecord::Migration
  def change
    create_table :supplemental_details do |t|
      t.string :honors
      t.string :source_of_funding
      t.string :civil_status
      t.string :dual_citizenship
      t.string :notify_name
      t.string :notify_relationship
      t.string :notify_mobile
      t.string :notify_email
      t.string :housing
      t.string :source_of_information
      t.string :objective

      t.timestamps
    end
  end
end
