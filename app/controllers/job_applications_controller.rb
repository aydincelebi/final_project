class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  # GET /job_applications
  def index
    @job_applications = JobApplication.all
  end

  # GET /job_applications/1
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications
  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      redirect_to @job_application, notice: 'Job application was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /job_applications/1
  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application, notice: 'Job application was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /job_applications/1
  def destroy
    @job_application.destroy
    redirect_to job_applications_url, notice: 'Job application was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_application_params
      params.require(:job_application).permit(:name, :description, :company_id, :interest_level, :platform, :networking, :comments, :applied_on, :heard_back_on, :user_id, :job_type_id, :url)
    end
end
