class EducationDetail < ActiveRecord::Base
  attr_accessible :highest_school_address, :highest_school_commencement_date, :highest_school_course_title, :highest_school_degree, :highest_school_end_date, :highest_school_name, :last_school_address, :last_school_commencement_date, :last_school_course_title, :last_school_degree, :last_school_end_date, :last_school_name
  has_one :online_application_form, :dependent => :destroy
end
