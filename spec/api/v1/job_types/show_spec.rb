require "rails_helper"

RSpec.describe "job_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/job_types/#{job_type.id}", params: params
  end

  describe "basic fetch" do
    let!(:job_type) { create(:job_type) }

    it "works" do
      expect(JobTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("job_types")
      expect(d.id).to eq(job_type.id)
    end
  end
end
