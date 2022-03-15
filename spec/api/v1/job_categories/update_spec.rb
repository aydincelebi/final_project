require "rails_helper"

RSpec.describe "job_categories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/job_categories/#{job_category.id}", payload
  end

  describe "basic update" do
    let!(:job_category) { create(:job_category) }

    let(:payload) do
      {
        data: {
          id: job_category.id.to_s,
          type: "job_categories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(JobCategoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { job_category.reload.attributes }
    end
  end
end
