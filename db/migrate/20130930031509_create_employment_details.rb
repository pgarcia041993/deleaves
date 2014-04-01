class CreateEmploymentDetails < ActiveRecord::Migration
  def change
    create_table :employment_details do |t|
      t.string :company_name
      t.string :work_address
      t.string :work_phone
      t.string :work_industry
      t.string :company_type
      t.string :company_position
      t.string :position_level
      t.string :work_job_responsibilities
      t.date :date_hired
      t.date :date_fired
      t.string :manager_exp_years
      t.string :years_work_experience

      t.timestamps
    end
  end
end
