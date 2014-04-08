require 'csv'
headers = {}
students = {}
names= {}

counter = 0
CSV.foreach("#{Rails.root}/#{ARGV[0]}") do |row|
  counter = counter + 1

  if counter < 4
    next
  elsif counter == 4
    col_counter = 0
    row.each do |col|
      #puts col

      if col_counter <= 1
      else
        #this will be the column of subjects
        headers.merge!(col_counter => col) unless col == 'GPA'
      end
      col_counter = col_counter + 1
    end
  else
    grades = {}
    headers.each_pair do |k, v|
      grades.merge!(v => row[k])
    end
    students.merge!({row[0] => row[1]} => grades)
    #names.merge!(row[1] => grades)


  end

end

students.each_pair do |student, scores|
  student_search = Student.where(number: student.keys.first).first
  if student_search.blank?
    student_search = Student.create!(number: student.keys.first, name: student[student.keys.first])
  end

  puts student_search
  scores.each_pair do |subject, score|
    Grade.create!(student_id: student_search.id, temporary_subject_code: subject, grade: score)
    puts "#{student.keys.first} : #{student[student.keys.first]} : #{subject} : #{score}"
  end
end

puts "Done"