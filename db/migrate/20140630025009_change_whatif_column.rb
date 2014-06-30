class ChangeWhatifColumn < ActiveRecord::Migration
  def change
    remove_column :grades, :whatfi
    add_column :grades, :whatif, :decimal
  end
end
