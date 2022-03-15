class Api::V1::InterviewStylesController < Api::V1::GraphitiController
  def index
    interview_styles = InterviewStyleResource.all(params)
    respond_with(interview_styles)
  end

  def show
    interview_style = InterviewStyleResource.find(params)
    respond_with(interview_style)
  end

  def create
    interview_style = InterviewStyleResource.build(params)

    if interview_style.save
      render jsonapi: interview_style, status: 201
    else
      render jsonapi_errors: interview_style
    end
  end

  def update
    interview_style = InterviewStyleResource.find(params)

    if interview_style.update_attributes
      render jsonapi: interview_style
    else
      render jsonapi_errors: interview_style
    end
  end

  def destroy
    interview_style = InterviewStyleResource.find(params)

    if interview_style.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: interview_style
    end
  end
end
