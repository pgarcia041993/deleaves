class CreateComputedGpas < ActiveRecord::Migration
  def change
    create_table :computed_gpas do |t|
      t.string :student_number
      t.decimal :computed_gpa
      t.decimal :rank

      t.timestamps
    end
  end
end
