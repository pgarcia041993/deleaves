class CreateTermunits < ActiveRecord::Migration
  def change
    create_table :termunits do |t|
      t.string :cohort
      t.string :term
      t.float :units

      t.timestamps
    end
  end
end
