class ChangeToTextFields < ActiveRecord::Migration
  def change
    change_column :employment_details, :work_job_responsibilities, :text
    change_column :employment_details, :work_address, :text
    change_column :education_details, :last_school_address, :text
    change_column :education_details, :highest_school_address, :text
  end

end
