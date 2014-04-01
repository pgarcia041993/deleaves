class AddCompositeUpdatedAtOnlineApplicationForm < ActiveRecord::Migration
  def change
    add_column :online_application_forms, :composite_updated_at, :datetime
  end
end
