class JobCategoriesController < ApplicationController
  before_action :set_job_category, only: %i[show edit update destroy]

  def index
    @q = JobCategory.ransack(params[:q])
    @job_categories = @q.result(distinct: true).includes(:job_application,
                                                         :category).page(params[:page]).per(10)
  end

  def show; end

  def new
    @job_category = JobCategory.new
  end

  def edit; end

  def create
    @job_category = JobCategory.new(job_category_params)

    if @job_category.save
      message = "JobCategory was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @job_category, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @job_category.update(job_category_params)
      redirect_to @job_category,
                  notice: "Job category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job_category.destroy
    message = "JobCategory was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to job_categories_url, notice: message
    end
  end

  private

  def set_job_category
    @job_category = JobCategory.find(params[:id])
  end

  def job_category_params
    params.require(:job_category).permit(:category_id, :job_application_id)
  end
end
