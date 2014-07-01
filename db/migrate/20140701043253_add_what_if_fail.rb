class AddWhatIfFail < ActiveRecord::Migration
  def change
    add_column :students, :whatif_fail, :decimal
  end
end