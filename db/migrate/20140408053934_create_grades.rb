class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :subject_id
      t.string :temporary_subject_code
      t.string :grade
      t.integer :student_id

      t.timestamps
    end
  end
end
