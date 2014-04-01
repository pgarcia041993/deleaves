class OnlineApplicationFormsController < ApplicationController
  # GET /online_application_forms
  # GET /online_application_forms.json
  def index
    @online_application_forms = OnlineApplicationForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @online_application_forms }
    end
  end

  # GET /online_application_forms/1
  # GET /online_application_forms/1.json
  def show
    @online_application_form = OnlineApplicationForm.find(params[:id])
    @online_application_form.update_attribute :read_status, true

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @online_application_form }
    end
  end

  # GET /online_application_forms/new
  # GET /online_application_forms/new.json
  def new
    @online_application_form = OnlineApplicationForm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @online_application_form }
    end
  end

  # GET /online_application_forms/1/edit
  def edit
    @online_application_form = OnlineApplicationForm.find(params[:id])
  end

  # POST /online_application_forms
  # POST /online_application_forms.json
  def create
    @online_application_form = OnlineApplicationForm.new(params[:online_application_form])

    respond_to do |format|
      if @online_application_form.save
        format.html { redirect_to @online_application_form, notice: 'Online application form was successfully created.' }
        format.json { render json: @online_application_form, status: :created, location: @online_application_form }
      else
        format.html { render action: "new" }
        format.json { render json: @online_application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /online_application_forms/1
  # PUT /online_application_forms/1.json
  def update
    @online_application_form = OnlineApplicationForm.find(params[:id])

    respond_to do |format|
      if @online_application_form.update_attributes(params[:online_application_form])
        format.html { redirect_to @online_application_form, notice: 'Online application form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @online_application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /online_application_forms/1
  # DELETE /online_application_forms/1.json
  def destroy
    @online_application_form = OnlineApplicationForm.find(params[:id])
    @online_application_form.destroy

    respond_to do |format|
      format.html { redirect_to online_application_forms_url }
      format.json { head :no_content }
    end
  end

  def update_status
    form = OnlineApplicationForm.find(params[:id])
    form.update_attribute :status, params[:status]
    redirect_to online_application_form_path(params[:id])
  end
end
