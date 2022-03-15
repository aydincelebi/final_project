class Api::V1::JobCategoriesController < Api::V1::GraphitiController
  def index
    job_categories = JobCategoryResource.all(params)
    respond_with(job_categories)
  end

  def show
    job_category = JobCategoryResource.find(params)
    respond_with(job_category)
  end

  def create
    job_category = JobCategoryResource.build(params)

    if job_category.save
      render jsonapi: job_category, status: :created
    else
      render jsonapi_errors: job_category
    end
  end

  def update
    job_category = JobCategoryResource.find(params)

    if job_category.update_attributes
      render jsonapi: job_category
    else
      render jsonapi_errors: job_category
    end
  end

  def destroy
    job_category = JobCategoryResource.find(params)

    if job_category.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: job_category
    end
  end
end
