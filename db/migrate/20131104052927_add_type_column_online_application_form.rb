class AddTypeColumnOnlineApplicationForm < ActiveRecord::Migration
  def change
    add_column :online_application_forms, :type, :string  #hello
  end
end