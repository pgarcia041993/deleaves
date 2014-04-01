class CreateOnlineApplicationForms < ActiveRecord::Migration
  def change
    create_table :online_application_forms do |t|
      t.integer :user_id
      t.integer :personal_detail_id
      t.integer :employment_detail_id
      t.integer :education_detail_id
      t.integer :supporting_document_id

      t.timestamps
    end
  end
end
