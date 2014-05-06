require 'csv'
headers = {}
students = {}

counter = 0
CSV.foreach("#{Rails.root}/#{ARGV[0]}") do |row|
  counter = counter + 1

  if counter < 2
    next
  elsif counter == 2
    col_counter = 0
    row.each do |col|
      puts col
      if col_counter == 0
      else
        headers.merge!(col_counter => col) unless col == 'GPA'
      end
      col_counter = col_counter + 1
    end
  else
    grades = {}
    headers.each_pair do |k, v|
      grades.merge!(v => row[k])
    end
    students.merge!(row[0] => grades)
  end

end

puts headers
puts students

students.each_pair do |student, scores|
  ##student_search = Student.where(number: student.keys.first).first
  #if student_search.blank?
  #  #student_search = Student.create!(number: student.keys.first, name: student[student.keys.first])
  #end

  #puts student_search
  scores.each_pair do |subject, score|
    #Grade.create!(student_id: student_search.id, temporary_subject_code: subject, grade: score)
    puts "#{student.keys.first} : #{student[student.keys.first]} : #{subject} : #{score}"
  end
end