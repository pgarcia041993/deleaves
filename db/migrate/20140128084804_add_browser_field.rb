class AddBrowserField < ActiveRecord::Migration
  def change
    add_column :online_application_forms, :browser, :string
  end
end
