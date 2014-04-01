class AdmissionsController < ApplicationController

  # The edit method will be used as all applications will be pre-generated

  def index
    @online_applications = OnlineApplicationForm.where('personal_detail_id is not null')
  end

  def edit
    @online_application = OnlineApplicationForm.find(params[:id])
    @personal_details = @online_application.personal_detail
    @employment_detail = @online_application.employment_detail
    @education_detail = @online_application.education_detail


    respond_to do |format|
      format.html
    end
  end

  def create
    if params[:email].blank?
      redirect_to '/', {alert: 'An e-mail address is necessary to apply online. Kindly provide you e-mail address.'} and return
    elsif params[:email].match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/).nil?
      redirect_to '/', {alert: 'You must provide a valid e-mail address in order to apply online. Kindly provide you e-mail address.'} and return
    end

    PersonalDetail.where(email: params[:email]).each do |x|
      if x.online_application_form.present? && x.online_application_form.status != 90 && (x.online_application_form.personal_detail.present? && x.online_application_form.employment_detail.present? && x.online_application_form.education_detail)
        @online_application = x.online_application_form
      end
    end

    begin
      dob = DateTime.strptime(params[:dob], '%d/%m/%Y')
    rescue
      redirect_to '/', {alert: 'Please provide a valid date of birth.'} and return
    end

    # Check the password/DOB

    # Create the application if the online application form is not present.
    if @online_application.blank?
      @online_application = OnlineApplicationForm.create!(status: 10)
      @personal_details = PersonalDetail.create!(:email => params[:email], :dob => params[:dob])
      @employment_detail = EmploymentDetail.create!
      @education_detail = EducationDetail.create!

      @online_application.update_attributes!(personal_detail_id: @personal_details.id,
                                             employment_detail_id: @employment_detail.id,
                                             education_detail_id: @education_detail.id)
    elsif @online_application.present? && @online_application.personal_detail.dob.nil?
      PersonalDetail.where(email: params[:email]).each { |x| x.update_attribute :dob, dob }
    elsif @online_application.present? && @online_application.personal_detail.dob != dob
      redirect_to '/', {alert: 'We have found your application but your Date of Birth does not match our records. Please try again. If you continue to experience this issue, kindly contact us through <a href="mailto:icthelpdesk@aim.edu">icthelpdesk@aim.edu</a> or call +63 (2) 894 0043.'.html_safe} and return
    end

    redirect_to("/admissions/#{@online_application.id}/edit") and return
  end

  def update
    begin
      @online_application = OnlineApplicationForm.find(params[:id])
      @personal_details = @online_application.personal_detail
      @employment_detail = @online_application.employment_detail
      @education_detail = @online_application.education_detail

      personal_detail = params[:personal_detail]
      employment_detail = params[:personal_detail]
      education_detail = params[:personal_detail]

      personal_detail.each_pair do |k, v|
        personal_detail.merge!(k => DateTime.strptime(v, '%d/%m/%Y')) rescue next
      end

      employment_detail.each_pair do |k, v|
        employment_detail.merge!(k => DateTime.strptime(v, '%d/%m/%Y')) rescue next
      end

      education_detail.each_pair do |k, v|
        education_detail.merge!(k => DateTime.strptime(v, '%d/%m/%Y')) rescue next
      end

      @personal_details.update_attributes!(params[:personal_detail])
      @employment_detail.update_attributes!(params[:employment_detail])
      @education_detail.update_attributes!(params[:education_detail])

      @online_application.update_attribute :browser, request.env['HTTP_USER_AGENT']
    rescue Exception => e
      # Add an exception hider
    end

    @supplemental_detail = SupplementalDetail.create!
    @online_application.update_attribute :supplemental_detail_id, @supplemental_detail.id

    redirect_to edit_supplemental_detail_path(@supplemental_detail)
  end

  def clean_params(params)
    params.each_pair do |key, value|
      params.merge!(key => DateTime.strptime(value, '%d/%m/%Y')) if key.scan('date').count > 0
    end
  end

end
