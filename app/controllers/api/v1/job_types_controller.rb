class Api::V1::JobTypesController < Api::V1::GraphitiController
  def index
    job_types = JobTypeResource.all(params)
    respond_with(job_types)
  end

  def show
    job_type = JobTypeResource.find(params)
    respond_with(job_type)
  end

  def create
    job_type = JobTypeResource.build(params)

    if job_type.save
      render jsonapi: job_type, status: 201
    else
      render jsonapi_errors: job_type
    end
  end

  def update
    job_type = JobTypeResource.find(params)

    if job_type.update_attributes
      render jsonapi: job_type
    else
      render jsonapi_errors: job_type
    end
  end

  def destroy
    job_type = JobTypeResource.find(params)

    if job_type.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: job_type
    end
  end
end
