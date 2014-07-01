class ComputedGpasController < ApplicationController
  # GET /computed_gpas
  # GET /computed_gpas.json
  def index
    @computed_gpas = ComputedGpa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @computed_gpas }
    end
  end

  # GET /computed_gpas/1
  # GET /computed_gpas/1.json
  def show
    @computed_gpa = ComputedGpa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @computed_gpa }
    end
  end

  # GET /computed_gpas/new
  # GET /computed_gpas/new.json
  def new
    @computed_gpa = ComputedGpa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @computed_gpa }
    end
  end

  # GET /computed_gpas/1/edit
  def edit
    @computed_gpa = ComputedGpa.find(params[:id])
  end

  # POST /computed_gpas
  # POST /computed_gpas.json
  def create
    @computed_gpa = ComputedGpa.new(params[:computed_gpa])

    respond_to do |format|
      if @computed_gpa.save
        format.html { redirect_to @computed_gpa, notice: 'Computed gpa was successfully created.' }
        format.json { render json: @computed_gpa, status: :created, location: @computed_gpa }
      else
        format.html { render action: "new" }
        format.json { render json: @computed_gpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /computed_gpas/1
  # PUT /computed_gpas/1.json
  def update
    @computed_gpa = ComputedGpa.find(params[:id])

    respond_to do |format|
      if @computed_gpa.update_attributes(params[:computed_gpa])
        format.html { redirect_to @computed_gpa, notice: 'Computed gpa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @computed_gpa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computed_gpas/1
  # DELETE /computed_gpas/1.json
  def destroy
    @computed_gpa = ComputedGpa.find(params[:id])
    @computed_gpa.destroy

    respond_to do |format|
      format.html { redirect_to computed_gpas_url }
      format.json { head :no_content }
    end
  end
end
