class ApplicationWebsitesController < ApplicationController
  before_action :set_application_website,
                only: %i[show edit update destroy]

  def index
    @q = ApplicationWebsite.ransack(params[:q])
    @application_websites = @q.result(distinct: true).includes(:job_applications).page(params[:page]).per(10)
  end

  def show
    @job_application = JobApplication.new
  end

  def new
    @application_website = ApplicationWebsite.new
  end

  def edit; end

  def create
    @application_website = ApplicationWebsite.new(application_website_params)

    if @application_website.save
      redirect_to @application_website,
                  notice: "Application website was successfully created."
    else
      render :new
    end
  end

  def update
    if @application_website.update(application_website_params)
      redirect_to @application_website,
                  notice: "Application website was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @application_website.destroy
    redirect_to application_websites_url,
                notice: "Application website was successfully destroyed."
  end

  private

  def set_application_website
    @application_website = ApplicationWebsite.find(params[:id])
  end

  def application_website_params
    params.require(:application_website).permit(:url, :name)
  end
end
