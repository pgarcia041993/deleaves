class Requirement < ActiveRecord::Base
  attr_accessible :file_name, :online_application_form_id, :requirement_type_id
  belongs_to :online_application_form
end
