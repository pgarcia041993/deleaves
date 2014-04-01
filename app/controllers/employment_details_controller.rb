class EmploymentDetailsController < ApplicationController
  # GET /employment_details
  # GET /employment_details.json
  def index
    @employment_details = EmploymentDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @employment_details }
    end
  end

  # GET /employment_details/1
  # GET /employment_details/1.json
  def show
    @employment_detail = EmploymentDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @employment_detail }
    end
  end

  # GET /employment_details/new
  # GET /employment_details/new.json
  def new
    @employment_detail = EmploymentDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @employment_detail }
    end
  end

  # GET /employment_details/1/edit
  def edit
    @employment_detail = EmploymentDetail.find(params[:id])
  end

  # POST /employment_details
  # POST /employment_details.json
  def create
    @employment_detail = EmploymentDetail.new(params[:employment_detail])

    respond_to do |format|
      if @employment_detail.save
        format.html { redirect_to @employment_detail, notice: 'Employment detail was successfully created.' }
        format.json { render json: @employment_detail, status: :created, location: @employment_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @employment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /employment_details/1
  # PUT /employment_details/1.json
  def update
    @employment_detail = EmploymentDetail.find(params[:id])

    respond_to do |format|
      if @employment_detail.update_attributes(params[:employment_detail])
        format.html { redirect_to @employment_detail, notice: 'Employment detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @employment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_details/1
  # DELETE /employment_details/1.json
  def destroy
    @employment_detail = EmploymentDetail.find(params[:id])
    @employment_detail.destroy

    respond_to do |format|
      format.html { redirect_to employment_details_url }
      format.json { head :no_content }
    end
  end
end
