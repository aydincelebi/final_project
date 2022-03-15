require 'rails_helper'

RSpec.describe "job_categories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/job_categories/#{job_category.id}", params: params
  end

  describe 'basic fetch' do
    let!(:job_category) { create(:job_category) }

    it 'works' do
      expect(JobCategoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('job_categories')
      expect(d.id).to eq(job_category.id)
    end
  end
end
