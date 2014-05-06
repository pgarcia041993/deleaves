class AddCustomFields < ActiveRecord::Migration
  def up
    add_column :students, :fail, :integer
    add_column :students, :gpa, :string
    add_column :students, :term, :string
    add_column :students, :rank, :string
    add_column :students, :scholar, :integer
  end


end
