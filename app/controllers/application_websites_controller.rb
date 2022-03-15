class ApplicationWebsitesController < ApplicationController
  before_action :set_application_website, only: [:show, :edit, :update, :destroy]

  # GET /application_websites
  def index
    @application_websites = ApplicationWebsite.page(params[:page]).per(10)
  end

  # GET /application_websites/1
  def show
    @job_application = JobApplication.new
  end

  # GET /application_websites/new
  def new
    @application_website = ApplicationWebsite.new
  end

  # GET /application_websites/1/edit
  def edit
  end

  # POST /application_websites
  def create
    @application_website = ApplicationWebsite.new(application_website_params)

    if @application_website.save
      redirect_to @application_website, notice: 'Application website was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /application_websites/1
  def update
    if @application_website.update(application_website_params)
      redirect_to @application_website, notice: 'Application website was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /application_websites/1
  def destroy
    @application_website.destroy
    redirect_to application_websites_url, notice: 'Application website was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application_website
      @application_website = ApplicationWebsite.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_website_params
      params.require(:application_website).permit(:name, :url)
    end
end
