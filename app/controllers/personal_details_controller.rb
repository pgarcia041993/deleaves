class PersonalDetailsController < ApplicationController
  # GET /personal_details
  # GET /personal_details.json
  def index
    @personal_details = PersonalDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personal_details }
    end
  end

  # GET /personal_details/1
  # GET /personal_details/1.json
  def show
    @personal_detail = PersonalDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @personal_detail }
    end
  end

  # GET /personal_details/new
  # GET /personal_details/new.json
  def new
    @personal_detail = PersonalDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @personal_detail }
    end
  end

  # GET /personal_details/1/edit
  def edit
    @personal_detail = PersonalDetail.find(params[:id])
  end

  # POST /personal_details
  # POST /personal_details.json
  def create
    @personal_detail = PersonalDetail.new(params[:personal_detail])

    respond_to do |format|
      if @personal_detail.save
        format.html { redirect_to @personal_detail, notice: 'Personal detail was successfully created.' }
        format.json { render json: @personal_detail, status: :created, location: @personal_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /personal_details/1
  # PUT /personal_details/1.json
  def update
    @personal_detail = PersonalDetail.find(params[:id])

    respond_to do |format|
      if @personal_detail.update_attributes(params[:personal_detail])
        format.html { redirect_to @personal_detail, notice: 'Personal detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_details/1
  # DELETE /personal_details/1.json
  def destroy
    @personal_detail = PersonalDetail.find(params[:id])
    @personal_detail.destroy

    respond_to do |format|
      format.html { redirect_to personal_details_url }
      format.json { head :no_content }
    end
  end
end
