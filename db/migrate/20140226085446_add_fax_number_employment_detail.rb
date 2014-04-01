class AddFaxNumberEmploymentDetail < ActiveRecord::Migration
  def change
    add_column :employment_details, :work_fax_number, :string
  end
end
