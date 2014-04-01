class PersonalDetail < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :address_country, :address_post_code, :address_state, :cell_phone, :citizenship, :city, :civil_status, :dob, :email, :first_name, :gender, :home_phone, :last_name, :medications, :middle_name
  has_one :online_application_form, :dependent => :destroy
end
