class AddWhatIfGpaRank < ActiveRecord::Migration
  def change
    add_column :students, :whatif_gpa, :decimal
    add_column :students, :whatif_rank, :integer
  end
end
