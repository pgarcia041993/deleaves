class OnlineInquiriesController < ApplicationController

  def index
    @inquiries = OnlineInquiry.all
  end

  def new

  end

  def create
    @personal_detail = PersonalDetail.create!(params[:personal_detail])
    @online_inquiry = OnlineInquiry.create!(personal_detail_id: @personal_detail.id)
  end
end