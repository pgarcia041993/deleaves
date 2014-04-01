class RequirementsController < ApplicationController
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requirements }
    end
  end

  # GET /requirements/1
  # GET /requirements/1.json
  def show
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/new
  # GET /requirements/new.json
  def new
    @requirement = Requirement.new
    @key = "mba/436/1/${filename}"
    @success_action_redirect = 'http://localhost:3000/submit_requirement/?online_application_form_id=436&requirement_type_id=1'

    @access_key = 'AKIAITSSLQL5NKW2DQQA'
    @access_secret = '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'
    policy_document = "{\"expiration\": \"2020-01-01T00:00:00Z\", \"conditions\": [ {\"bucket\": \"online-admissions\"}, [\"starts-with\", \"$key\", \"mba/\"], {\"acl\": \"public-read\"}, {\"success_action_redirect\": \"#{@success_action_redirect}\"}, [\"content-length-range\", 0, 10485760] ]}"

    require 'base64'
    require 'openssl'
    require 'digest/sha1'

    @policy = Base64.encode64(policy_document).gsub("\n","")

    @signature = Base64.encode64(
        OpenSSL::HMAC.digest(
            OpenSSL::Digest::Digest.new('sha1'),
            @access_secret, @policy)
    ).gsub("\n","")


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @requirement }
    end
  end

  # GET /requirements/1/edit
  def edit
    @requirement = Requirement.find(params[:id])
  end

  # POST /requirements
  # POST /requirements.json
  def create
    @requirement = Requirement.new(params[:requirement])

    respond_to do |format|
      if @requirement.save
        format.html { redirect_to @requirement, notice: 'Requirement was successfully created.' }
        format.json { render json: @requirement, status: :created, location: @requirement }
      else
        format.html { render action: "new" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /requirements/1
  # PUT /requirements/1.json
  def update
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      if @requirement.update_attributes(params[:requirement])
        format.html { redirect_to @requirement, notice: 'Requirement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @requirement = Requirement.find(params[:id])
    @requirement.destroy

    respond_to do |format|
      format.html { redirect_to requirements_url }
      format.json { head :no_content }
    end
  end

  def submit_requirement
    requirement = Requirement.create!(online_application_form_id: params['online_application_form_id'],
                        requirement_type_id: params['requirement_type_id'],
                        file_name: params['key'])

    redirect_to edit_supplemental_detail_path(requirement.online_application_form.supplemental_detail), :notice => 'Requirement uploaded successfully.'
  end
end
