class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[show edit update destroy]

  def index
    @q = JobApplication.ransack(params[:q])
    @job_applications = @q.result(distinct: true).includes(:firm,
                                                           :interviews, :job_categories, :user, :jobwebsite, :categories).page(params[:page]).per(10)
  end

  def show
    @job_category = JobCategory.new
    @interview = Interview.new
  end

  def new
    @job_application = JobApplication.new
  end

  def edit; end

  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      message = "JobApplication was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @job_application, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @job_application.update(job_application_params)
      redirect_to @job_application,
                  notice: "Job application was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job_application.destroy
    message = "JobApplication was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to job_applications_url, notice: message
    end
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:name, :description, :company_id,
                                            :interest_level, :platform, :networking, :comments, :applied_on, :heard_back_on, :user_id, :job_type_id, :url)
  end
end
