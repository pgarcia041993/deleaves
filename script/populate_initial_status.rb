OnlineApplicationForm.all.each do |form|
  form.update_attribute :status, 10
  form.update_attribute :substatus, 11
end

puts "SUCCESS"