class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :number
      t.string :name
      t.integer :cohort
      t.integer :learning_team
      t.integer :grade_id

      t.timestamps
    end
  end
end
