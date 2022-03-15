require "rails_helper"

RSpec.describe "job_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/job_types", params: params
  end

  describe "basic fetch" do
    let!(:job_type1) { create(:job_type) }
    let!(:job_type2) { create(:job_type) }

    it "works" do
      expect(JobTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["job_types"])
      expect(d.map(&:id)).to match_array([job_type1.id, job_type2.id])
    end
  end
end
