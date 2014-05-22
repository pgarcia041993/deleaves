class CreateSubjectSummaries < ActiveRecord::Migration
  def change
    create_table :subject_summaries do |t|
      t.string :subject_code
      t.string :description
      t.string :professor
      t.string :units
      t.string :cohort
      t.string :term

      t.timestamps
    end
  end
end
