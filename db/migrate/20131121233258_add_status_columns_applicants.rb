class AddStatusColumnsApplicants < ActiveRecord::Migration
  def change
    add_column :online_application_forms, :status, :integer
    add_column :online_application_forms, :substatus, :integer
  end
end
