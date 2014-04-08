class RemoveGradeIdStudent < ActiveRecord::Migration
  def change
    remove_column :students, :grade_id
  end
end
