class Student < ActiveRecord::Base
  attr_accessible :cohort, :grade_id, :learning_team, :name, :number
end
