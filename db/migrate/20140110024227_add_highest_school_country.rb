class AddHighestSchoolCountry < ActiveRecord::Migration
  def change
    add_column :education_details, :highest_school_country, :string
  end
end
