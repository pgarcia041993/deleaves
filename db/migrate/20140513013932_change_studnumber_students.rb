class ChangeStudnumberStudents < ActiveRecord::Migration
  def up
    change_column :students, :number, :string
  end


end
