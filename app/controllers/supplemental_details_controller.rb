class SupplementalDetailsController < ApplicationController
  include SupplementalDetailsHelper
  # GET /supplemental_details
  # GET /supplemental_details.json
  def index
    @supplemental_details = SupplementalDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @supplemental_details }
    end
  end

  # GET /supplemental_details/1
  # GET /supplemental_details/1.json
  def show
    @supplemental_detail = SupplementalDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplemental_detail }
    end
  end

  # GET /supplemental_details/new
  # GET /supplemental_details/new.json
  def new
    @supplemental_detail = SupplementalDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplemental_detail }
    end
  end

  # GET /supplemental_details/1/edit
  def edit
    @supplemental_detail = SupplementalDetail.find(params[:id])
    @access_key = 'AKIAITSSLQL5NKW2DQQA'

  end

  # POST /supplemental_details
  # POST /supplemental_details.json
  def create
    @supplemental_detail = SupplementalDetail.new(params[:supplemental_detail])

    respond_to do |format|
      if @supplemental_detail.save
        format.html { redirect_to @supplemental_detail, notice: 'Supplemental detail was successfully created.' }
        format.json { render json: @supplemental_detail, status: :created, location: @supplemental_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @supplemental_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /supplemental_details/1
  # PUT /supplemental_details/1.json
  def update
    @supplemental_detail = SupplementalDetail.find(params[:id])

    respond_to do |format|
      if @supplemental_detail.update_attributes(params[:supplemental_detail])
        format.html { redirect_to edit_supplemental_detail_path(@supplemental_detail), notice: 'Supplemental detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplemental_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplemental_details/1
  # DELETE /supplemental_details/1.json
  def destroy
    @supplemental_detail = SupplementalDetail.find(params[:id])
    @supplemental_detail.destroy

    respond_to do |format|
      format.html { redirect_to supplemental_details_url }
      format.json { head :no_content }
    end
  end
end
