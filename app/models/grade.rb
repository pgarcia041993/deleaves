class Grade < ActiveRecord::Base
  attr_accessible :grade, :student_id, :subject_id, :temporary_subject_code , :units , :whatif , :term
  belongs_to :student
end
