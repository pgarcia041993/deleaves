class AddWhatifColumnGrades < ActiveRecord::Migration
  def up
    add_column :grades, :whatfi, :float
  end


end
