class SubjectSummariesController < ApplicationController
  # GET /subject_summaries
  # GET /subject_summaries.json
  def index
    @subject_summaries = SubjectSummary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subject_summaries }
    end
  end

  # GET /subject_summaries/1
  # GET /subject_summaries/1.json
  def show
    @subject_summary = SubjectSummary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject_summary }
    end
  end

  # GET /subject_summaries/new
  # GET /subject_summaries/new.json
  def new
    @subject_summary = SubjectSummary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject_summary }
    end
  end

  # GET /subject_summaries/1/edit
  def edit
    @subject_summary = SubjectSummary.find(params[:id])
  end

  # POST /subject_summaries
  # POST /subject_summaries.json
  def create
    @subject_summary = SubjectSummary.new(params[:subject_summary])

    respond_to do |format|
      if @subject_summary.save
        format.html { redirect_to @subject_summary, notice: 'Subject summary was successfully created.' }
        format.json { render json: @subject_summary, status: :created, location: @subject_summary }
      else
        format.html { render action: "new" }
        format.json { render json: @subject_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subject_summaries/1
  # PUT /subject_summaries/1.json
  def update
    @subject_summary = SubjectSummary.find(params[:id])

    respond_to do |format|
      if @subject_summary.update_attributes(params[:subject_summary])
        format.html { redirect_to @subject_summary, notice: 'Subject summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subject_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_summaries/1
  # DELETE /subject_summaries/1.json
  def destroy
    @subject_summary = SubjectSummary.find(params[:id])
    @subject_summary.destroy

    respond_to do |format|
      format.html { redirect_to subject_summaries_url }
      format.json { head :no_content }
    end
  end
end
