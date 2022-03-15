require "rails_helper"

RSpec.describe "application_websites#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/application_websites/#{application_website.id}",
                payload
  end

  describe "basic update" do
    let!(:application_website) { create(:application_website) }

    let(:payload) do
      {
        data: {
          id: application_website.id.to_s,
          type: "application_websites",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ApplicationWebsiteResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { application_website.reload.attributes }
    end
  end
end
