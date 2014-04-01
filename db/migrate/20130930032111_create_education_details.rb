class CreateEducationDetails < ActiveRecord::Migration
  def change
    create_table :education_details do |t|
      t.string :last_school_name
      t.string :last_school_course_title
      t.string :last_school_degree
      t.string :last_school_address
      t.date :last_school_commencement_date
      t.date :last_school_end_date
      t.string :highest_school_name
      t.string :highest_school_course_title
      t.string :highest_school_degree
      t.string :highest_school_address
      t.date :highest_school_commencement_date
      t.date :highest_school_end_date

      t.timestamps
    end
  end
end
