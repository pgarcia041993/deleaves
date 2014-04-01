class AddFundingSourcePersonalDetail < ActiveRecord::Migration
  def change
    add_column :personal_details, :funding_source, :string
  end
end
