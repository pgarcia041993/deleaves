class AddTrankTgpaStudents < ActiveRecord::Migration
  def up
    add_column :students , :trank , :string
    add_column :students , :tgpa ,:string
  end


end
