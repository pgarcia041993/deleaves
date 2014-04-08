class Student < ActiveRecord::Base
  attr_accessible :cohort, :learning_team, :name, :number
  has_many :grades

  def gpa
    self.grades.average(:grade)
  end
end
