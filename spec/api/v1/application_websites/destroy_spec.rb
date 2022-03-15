require "rails_helper"

RSpec.describe "application_websites#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/application_websites/#{application_website.id}"
  end

  describe "basic destroy" do
    let!(:application_website) { create(:application_website) }

    it "updates the resource" do
      expect(ApplicationWebsiteResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ApplicationWebsite.count }.by(-1)
      expect { application_website.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
