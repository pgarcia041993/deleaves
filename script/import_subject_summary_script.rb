require 'csv'
data={}
grades = {}
counter = 0
#SubjectSummary.destroy_all
CSV.foreach("#{Rails.root}/#{ARGV[0]}") do |row|
  counter = counter + 1

  if counter >0
    col_counter = 1
    row.each do |col|
      data.merge!(col_counter => col)
     col_counter = col_counter + 1
    end

  end

end
puts data

data.each_pair do |student,code|

  SubjectSummary.create!(subject_code: code, description:student professor)

end
#students.each_pair do |student, scores|
#  ##student_search = Student.where(number: student.keys.first).first
#  #if student_search.blank?
#  #  #student_search = Student.create!(number: student.keys.first, name: student[student.keys.first])
#  #end
#
#  #puts student_search
#  scores.each_pair do |subject, score|
#Grade.create!(student_id: student_search.id, temporary_subject_code: subject, grade: score)
#    puts "#{student.keys.first} : #{student[student.keys.first]} : #{subject} : #{score}"
#  end
#end