class AddSupplementalDetail < ActiveRecord::Migration

  def change
    add_column :online_application_forms, :supplemental_detail_id, :integer
  end

end
