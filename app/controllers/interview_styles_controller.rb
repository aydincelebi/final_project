class InterviewStylesController < ApplicationController
  before_action :set_interview_style, only: %i[show edit update destroy]

  def index
    @q = InterviewStyle.ransack(params[:q])
    @interview_styles = @q.result(distinct: true).includes(:interview,
                                                           :style).page(params[:page]).per(10)
  end

  def show; end

  def new
    @interview_style = InterviewStyle.new
  end

  def edit; end

  def create
    @interview_style = InterviewStyle.new(interview_style_params)

    if @interview_style.save
      message = "InterviewStyle was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @interview_style, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @interview_style.update(interview_style_params)
      redirect_to @interview_style,
                  notice: "Interview style was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @interview_style.destroy
    message = "InterviewStyle was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to interview_styles_url, notice: message
    end
  end

  private

  def set_interview_style
    @interview_style = InterviewStyle.find(params[:id])
  end

  def interview_style_params
    params.require(:interview_style).permit(:interview_id, :style_id)
  end
end
