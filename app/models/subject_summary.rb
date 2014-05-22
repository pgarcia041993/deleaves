class SubjectSummary < ActiveRecord::Base
  attr_accessible :cohort, :description, :professor, :subject_code, :term, :units
end
