class Student < ActiveRecord::Base
  attr_accessible :cohort, :learning_team, :name, :number , :gpa , :fail , :scholar , :rank , :term , :tgpa , :trank
  has_many :grades


end
