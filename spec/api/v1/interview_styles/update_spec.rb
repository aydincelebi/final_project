require "rails_helper"

RSpec.describe "interview_styles#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/interview_styles/#{interview_style.id}", payload
  end

  describe "basic update" do
    let!(:interview_style) { create(:interview_style) }

    let(:payload) do
      {
        data: {
          id: interview_style.id.to_s,
          type: "interview_styles",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(InterviewStyleResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { interview_style.reload.attributes }
    end
  end
end
