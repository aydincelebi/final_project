require "rails_helper"

RSpec.describe "interview_styles#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interview_styles/#{interview_style.id}", params: params
  end

  describe "basic fetch" do
    let!(:interview_style) { create(:interview_style) }

    it "works" do
      expect(InterviewStyleResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("interview_styles")
      expect(d.id).to eq(interview_style.id)
    end
  end
end
