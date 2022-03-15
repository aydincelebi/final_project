class Api::V1::ApplicationWebsitesController < Api::V1::GraphitiController
  def index
    application_websites = ApplicationWebsiteResource.all(params)
    respond_with(application_websites)
  end

  def show
    application_website = ApplicationWebsiteResource.find(params)
    respond_with(application_website)
  end

  def create
    application_website = ApplicationWebsiteResource.build(params)

    if application_website.save
      render jsonapi: application_website, status: :created
    else
      render jsonapi_errors: application_website
    end
  end

  def update
    application_website = ApplicationWebsiteResource.find(params)

    if application_website.update_attributes
      render jsonapi: application_website
    else
      render jsonapi_errors: application_website
    end
  end

  def destroy
    application_website = ApplicationWebsiteResource.find(params)

    if application_website.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: application_website
    end
  end
end
