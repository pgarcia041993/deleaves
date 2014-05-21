require 'csv'
headers = {}
students = {}
grades = {}
counter = 0
Subject.delete_all
CSV.foreach("#{Rails.root}/#{ARGV[0]}") do |row|
  counter = counter + 1

  if counter == 0
    col_counter = 0
    row.each do |col|
      #puts col
      if col_counter == 0
      else
        headers.merge!(col_counter => col) unless col == 'GPA'
      end
      col_counter = col_counter + 1
    end
  else

    headers.each_pair do |k, v|
      grades.merge!(v => row[k])
    end
    students.merge!(row[0] =>row[1])
  end

end

#puts headers


students.each_pair do |student,code|
  Subject.create!(subject_code: code, description:student)
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