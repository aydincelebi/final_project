class InterviewStylesController < ApplicationController
  before_action :set_interview_style, only: [:show, :edit, :update, :destroy]

  # GET /interview_styles
  def index
    @q = InterviewStyle.ransack(params[:q])
    @interview_styles = @q.result(:distinct => true).includes(:interview, :style).page(params[:page]).per(10)
  end

  # GET /interview_styles/1
  def show
  end

  # GET /interview_styles/new
  def new
    @interview_style = InterviewStyle.new
  end

  # GET /interview_styles/1/edit
  def edit
  end

  # POST /interview_styles
  def create
    @interview_style = InterviewStyle.new(interview_style_params)

    if @interview_style.save
      message = 'InterviewStyle was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @interview_style, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /interview_styles/1
  def update
    if @interview_style.update(interview_style_params)
      redirect_to @interview_style, notice: 'Interview style was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /interview_styles/1
  def destroy
    @interview_style.destroy
    message = "InterviewStyle was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to interview_styles_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_style
      @interview_style = InterviewStyle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def interview_style_params
      params.require(:interview_style).permit(:interview_id, :style_id)
    end
end
