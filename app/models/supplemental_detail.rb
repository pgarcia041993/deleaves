class SupplementalDetail < ActiveRecord::Base
  attr_accessible :civil_status, :dual_citizenship, :honors, :housing, :notify_email, :notify_mobile, :notify_name, :notify_relationship, :objective, :source_of_funding, :source_of_information
  has_one :online_application_form
end
