class JobCategoriesController < ApplicationController
  before_action :set_job_category, only: [:show, :edit, :update, :destroy]

  # GET /job_categories
  def index
    @q = JobCategory.ransack(params[:q])
    @job_categories = @q.result(:distinct => true).includes(:job_application, :job, :category).page(params[:page]).per(10)
  end

  # GET /job_categories/1
  def show
  end

  # GET /job_categories/new
  def new
    @job_category = JobCategory.new
  end

  # GET /job_categories/1/edit
  def edit
  end

  # POST /job_categories
  def create
    @job_category = JobCategory.new(job_category_params)

    if @job_category.save
      message = 'JobCategory was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @job_category, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /job_categories/1
  def update
    if @job_category.update(job_category_params)
      redirect_to @job_category, notice: 'Job category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /job_categories/1
  def destroy
    @job_category.destroy
    message = "JobCategory was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to job_categories_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_category
      @job_category = JobCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_category_params
      params.require(:job_category).permit(:category_id, :job_application_id, :job_id)
    end
end
