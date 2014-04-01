class EducationDetailsController < ApplicationController
  # GET /education_details
  # GET /education_details.json
  def index
    @education_details = EducationDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @education_details }
    end
  end

  # GET /education_details/1
  # GET /education_details/1.json
  def show
    @education_detail = EducationDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @education_detail }
    end
  end

  # GET /education_details/new
  # GET /education_details/new.json
  def new
    @education_detail = EducationDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @education_detail }
    end
  end

  # GET /education_details/1/edit
  def edit
    @education_detail = EducationDetail.find(params[:id])
  end

  # POST /education_details
  # POST /education_details.json
  def create
    @education_detail = EducationDetail.new(params[:education_detail])

    respond_to do |format|
      if @education_detail.save
        format.html { redirect_to @education_detail, notice: 'Education detail was successfully created.' }
        format.json { render json: @education_detail, status: :created, location: @education_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @education_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /education_details/1
  # PUT /education_details/1.json
  def update
    @education_detail = EducationDetail.find(params[:id])

    respond_to do |format|
      if @education_detail.update_attributes(params[:education_detail])
        format.html { redirect_to @education_detail, notice: 'Education detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @education_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_details/1
  # DELETE /education_details/1.json
  def destroy
    @education_detail = EducationDetail.find(params[:id])
    @education_detail.destroy

    respond_to do |format|
      format.html { redirect_to education_details_url }
      format.json { head :no_content }
    end
  end
end
