class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @display_filter = ''
    @cohort_select = Student.all.map(&:cohort).uniq.reject { |x| x.nil? }
    session[:term]=nil
    if params['cohort'] == '0' || params['cohort'].blank?
      @applicants = Student.all
    elsif (params['cohort'].present?)
      @applicants = Student.where(cohort: params['cohort'] , term: params['term']).order("gpa DESC")

      session[:term] = params['term']
    end
  end

  def excel
    @online_applications = Student.where(cohort: params['cohort'] , term: params['term'])
  end

end