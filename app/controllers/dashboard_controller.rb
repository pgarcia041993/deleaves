class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @display_filter = ''
    if params['cohort'] == '0' || params['cohort'].blank?
      @applicants = Student.all
    elsif (params['cohort'].present?)
      @applicants = Student.where(cohort: params['cohort'] , term: params['term'])
    end
  end

  def excel
    @online_applications = OnlineApplicationForm.where('status != 90').order('id DESC')
  end

end