require 'rails_helper'

RSpec.describe "job_categories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/job_categories/#{job_category.id}"
  end

  describe 'basic destroy' do
    let!(:job_category) { create(:job_category) }

    it 'updates the resource' do
      expect(JobCategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { JobCategory.count }.by(-1)
      expect { job_category.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
