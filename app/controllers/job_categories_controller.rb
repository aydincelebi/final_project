class JobCategoriesController < ApplicationController
  before_action :set_job_category, only: [:show, :edit, :update, :destroy]

  # GET /job_categories
  def index
    @job_categories = JobCategory.all
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
      redirect_to @job_category, notice: 'Job category was successfully created.'
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
    redirect_to job_categories_url, notice: 'Job category was successfully destroyed.'
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
