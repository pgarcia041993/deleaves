class DeleteTypeColumnOnlineApplicationForm < ActiveRecord::Migration
  def change
    remove_column :online_application_forms, :type
  end
end
