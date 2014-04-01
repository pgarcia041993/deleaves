OnlineApplicationForm.all.each do |online_application_form|
  if online_application_form.created_at < Time.now.beginning_of_year
    online_application_form.update_attribute :read_status, true
  else
    online_application_form.update_attribute :read_status, false
  end
end