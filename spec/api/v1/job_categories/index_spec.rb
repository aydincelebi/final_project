require 'rails_helper'

RSpec.describe "job_categories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/job_categories", params: params
  end

  describe 'basic fetch' do
    let!(:job_category1) { create(:job_category) }
    let!(:job_category2) { create(:job_category) }

    it 'works' do
      expect(JobCategoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['job_categories'])
      expect(d.map(&:id)).to match_array([job_category1.id, job_category2.id])
    end
  end
end
