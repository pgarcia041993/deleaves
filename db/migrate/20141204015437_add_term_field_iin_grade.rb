class AddTermFieldIinGrade < ActiveRecord::Migration
  def up
    add_column :grades , :term , :string
  end


end
