class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :online_application_form_id
      t.integer :requirement_type_id
      t.string :file_name

      t.timestamps
    end
  end
end
