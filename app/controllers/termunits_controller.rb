class TermunitsController < ApplicationController
  # GET /termunits
  # GET /termunits.json
  def index
    @termunits = Termunit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @termunits }
    end
  end

  # GET /termunits/1
  # GET /termunits/1.json
  def show
    @termunit = Termunit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @termunit }
    end
  end

  # GET /termunits/new
  # GET /termunits/new.json
  def new
    @termunit = Termunit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @termunit }
    end
  end

  # GET /termunits/1/edit
  def edit
    @termunit = Termunit.find(params[:id])
  end

  # POST /termunits
  # POST /termunits.json
  def create
    @termunit = Termunit.new(params[:termunit])

    respond_to do |format|
      if @termunit.save
        format.html { redirect_to @termunit, notice: 'Termunit was successfully created.' }
        format.json { render json: @termunit, status: :created, location: @termunit }
      else
        format.html { render action: "new" }
        format.json { render json: @termunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /termunits/1
  # PUT /termunits/1.json
  def update
    @termunit = Termunit.find(params[:id])

    respond_to do |format|
      if @termunit.update_attributes(params[:termunit])
        format.html { redirect_to @termunit, notice: 'Termunit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @termunit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termunits/1
  # DELETE /termunits/1.json
  def destroy
    @termunit = Termunit.find(params[:id])
    @termunit.destroy

    respond_to do |format|
      format.html { redirect_to termunits_url }
      format.json { head :no_content }
    end
  end
end
