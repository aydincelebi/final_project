require 'rails_helper'

RSpec.describe "interview_styles#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/interview_styles", params: params
  end

  describe 'basic fetch' do
    let!(:interview_style1) { create(:interview_style) }
    let!(:interview_style2) { create(:interview_style) }

    it 'works' do
      expect(InterviewStyleResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['interview_styles'])
      expect(d.map(&:id)).to match_array([interview_style1.id, interview_style2.id])
    end
  end
end
