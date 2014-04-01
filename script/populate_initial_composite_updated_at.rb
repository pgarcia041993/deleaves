OnlineApplicationForm.all.each do |online_application_form|
  if online_application_form.personal_detail.present? && online_application_form.personal_detail.updated_at.present?
    online_application_form.update_attribute :composite_updated_at, online_application_form.personal_detail.updated_at
  elsif online_application_form.personal_detail.present? && online_application_form.personal_detail.created_at.present?
    online_application_form.update_attribute :composite_updated_at, online_application_form.personal_detail.created_at
  end
end