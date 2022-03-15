require 'rails_helper'

RSpec.describe "interview_styles#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/interview_styles/#{interview_style.id}"
  end

  describe 'basic destroy' do
    let!(:interview_style) { create(:interview_style) }

    it 'updates the resource' do
      expect(InterviewStyleResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { InterviewStyle.count }.by(-1)
      expect { interview_style.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
