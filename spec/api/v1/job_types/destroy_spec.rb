require 'rails_helper'

RSpec.describe "job_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/job_types/#{job_type.id}"
  end

  describe 'basic destroy' do
    let!(:job_type) { create(:job_type) }

    it 'updates the resource' do
      expect(JobTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { JobType.count }.by(-1)
      expect { job_type.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
