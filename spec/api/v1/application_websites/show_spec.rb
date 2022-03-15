require "rails_helper"

RSpec.describe "application_websites#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/application_websites/#{application_website.id}",
                params: params
  end

  describe "basic fetch" do
    let!(:application_website) { create(:application_website) }

    it "works" do
      expect(ApplicationWebsiteResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("application_websites")
      expect(d.id).to eq(application_website.id)
    end
  end
end
