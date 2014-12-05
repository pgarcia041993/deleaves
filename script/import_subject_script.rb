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
    students.merge!({row[0] => {name: row[1], term: row[2], grade: row[3], subject: row[4] , unit: row[5]}} => grades)
    #names.merge!(row[1] => grades)


  end

end




students.each_pair do |student, scores|
  #puts(student)


  Grade.create!(student_id: student.keys.first, grade: student[student.keys.first][:grade], term: student[student.keys.first][:term], temporary_subject_code: student[student.keys.first][:subject], units: student[student.keys.first][:unit])

  scores.each_pair do |subject, score|
    # Grade.create!(student_id: student_search.id, temporary_subject_code: subject, grade: score[1], units: score[0])
    #puts "#{student.keys.first} : #{student[student.keys.first]} : #{subject} : #{score}"
  end
end

puts "Done"