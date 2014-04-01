class AddReadFlagOnlineApplicationForms < ActiveRecord::Migration
  def change
    add_column :online_application_forms, :read_status, :boolean
  end
end
