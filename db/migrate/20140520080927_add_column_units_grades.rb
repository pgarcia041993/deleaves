class AddColumnUnitsGrades < ActiveRecord::Migration
  def up
    add_column :grades , :units , :string
  end


end
