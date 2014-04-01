class AddLastSchoolCountry < ActiveRecord::Migration
  def change
    add_column :education_details, :last_school_country, :string
  end
end
