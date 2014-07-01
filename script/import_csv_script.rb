require 'csv'
headers = {}
students = {}
names= {}
units = []
#Student.delete_all
#Grade.delete_all

counter = 0
CSV.foreach("#{Rails.root}/#{ARGV[0]}") do |row|
  counter = counter + 1


  if counter == 1
    row.each do |col|
      units << col
    end

  elsif counter == 2
    col_counter = 0
    row.each do |col|
      # puts col

      if col_counter <= 8
      else
        #this will be the column of subjects
        headers.merge!(col_counter => col) #unless col == 'GPA
      end
      col_counter = col_counter + 1
    end
  else
    grades = {}
    ctrl=9
    headers.each_pair do |k, v|
      #puts counter
      #puts units

      grades.merge!(v => [units[ctrl], row[k]])

      ctrl=ctrl+1

    end
    students.merge!({row[0] => {name: row[1], cohort: row[2], term: row[3], lt: row[4], gpa: row[5], rank: row[6], fail: row[7], scholar: row[8]}} => grades)
    #names.merge!(row[1] => grades)


  end

end




students.each_pair do |student, scores|
  #puts(student)


    student_search = Student.create!(number: student.keys.first, name: student[student.keys.first][:name], cohort: student[student.keys.first][:cohort], term: student[student.keys.first][:term], learning_team: student[student.keys.first][:lt], gpa: student[student.keys.first][:gpa], rank: student[student.keys.first][:rank], fail: student[student.keys.first][:fail], scholar: student[student.keys.first][:scholar])

  scores.each_pair do |subject, score|
    Grade.create!(student_id: student_search.id, temporary_subject_code: subject, grade: score[1], units: score[0])
    #puts "#{student.keys.first} : #{student[student.keys.first]} : #{subject} : #{score}"
  end
end

puts "Done"