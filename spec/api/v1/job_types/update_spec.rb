require "rails_helper"

RSpec.describe "job_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/job_types/#{job_type.id}", payload
  end

  describe "basic update" do
    let!(:job_type) { create(:job_type) }

    let(:payload) do
      {
        data: {
          id: job_type.id.to_s,
          type: "job_types",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(JobTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { job_type.reload.attributes }
    end
  end
end
