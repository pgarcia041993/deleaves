class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def index
    @display_filter = ''
    if params['status'] == '0' || params['status'].blank?
      temp_status_chart = OnlineApplicationForm.where('status != 90').count(:group => 'status')
      @status_chart = {}
      temp_status_chart.each_pair {|status_id, value| @status_chart.merge!(OnlineApplicationForm.get_status(status_id) => value)}
      @applicants = OnlineApplicationForm.where('status != 90').order('read_status ASC').order('composite_updated_at DESC')
    elsif (params['status'].present? && (params['status'].to_i % 10 == 0))
      temp_status_chart = OnlineApplicationForm.where(:status => params['status'].to_i).count(:group => 'substatus')
      @status_chart = {}
      temp_status_chart.each_pair do |status_id, value|
        status = status_id.nil? ? 'No Status' : OnlineApplicationForm.get_status(status_id)
        @status_chart.merge!(status => value)
      end
      @applicants = OnlineApplicationForm.where(status: params['status'].to_i).order('read_status ASC').order('composite_updated_at DESC')
    end
  end

  def excel
    @online_applications = OnlineApplicationForm.where('status != 90').order('id DESC')
  end

end