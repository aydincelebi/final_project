class JobTypesController < ApplicationController
  before_action :set_job_type, only: [:show, :edit, :update, :destroy]

  # GET /job_types
  def index
    @job_types = JobType.all
  end

  # GET /job_types/1
  def show
    @job_category = JobCategory.new
  end

  # GET /job_types/new
  def new
    @job_type = JobType.new
  end

  # GET /job_types/1/edit
  def edit
  end

  # POST /job_types
  def create
    @job_type = JobType.new(job_type_params)

    if @job_type.save
      redirect_to @job_type, notice: 'Job type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /job_types/1
  def update
    if @job_type.update(job_type_params)
      redirect_to @job_type, notice: 'Job type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /job_types/1
  def destroy
    @job_type.destroy
    redirect_to job_types_url, notice: 'Job type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_type
      @job_type = JobType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_type_params
      params.require(:job_type).permit(:product, :strategy, :new_business_launch, :venture_capital)
    end
end
