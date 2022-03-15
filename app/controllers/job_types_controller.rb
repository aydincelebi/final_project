class JobTypesController < ApplicationController
  before_action :set_job_type, only: %i[show edit update destroy]

  def index
    @q = JobType.ransack(params[:q])
    @job_types = @q.result(distinct: true).includes(:job_categories).page(params[:page]).per(10)
  end

  def show
    @job_category = JobCategory.new
  end

  def new
    @job_type = JobType.new
  end

  def edit; end

  def create
    @job_type = JobType.new(job_type_params)

    if @job_type.save
      redirect_to @job_type, notice: "Job type was successfully created."
    else
      render :new
    end
  end

  def update
    if @job_type.update(job_type_params)
      redirect_to @job_type, notice: "Job type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @job_type.destroy
    redirect_to job_types_url, notice: "Job type was successfully destroyed."
  end

  private

  def set_job_type
    @job_type = JobType.find(params[:id])
  end

  def job_type_params
    params.require(:job_type).permit(:product, :strategy,
                                     :new_business_launch, :venture_capital)
  end
end
