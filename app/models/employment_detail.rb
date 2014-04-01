class EmploymentDetail < ActiveRecord::Base
  attr_accessible :company_name, :company_position, :company_type, :date_fired, :date_hired, :manager_exp_years, :position_level, :work_address, :work_industry, :work_job_responsibilities, :work_phone, :years_work_experience, :work_fax_number
  has_one :online_application_form, :dependent => :destroy
end
