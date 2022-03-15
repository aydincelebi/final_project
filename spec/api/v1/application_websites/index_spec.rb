require 'rails_helper'

RSpec.describe "application_websites#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/application_websites", params: params
  end

  describe 'basic fetch' do
    let!(:application_website1) { create(:application_website) }
    let!(:application_website2) { create(:application_website) }

    it 'works' do
      expect(ApplicationWebsiteResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['application_websites'])
      expect(d.map(&:id)).to match_array([application_website1.id, application_website2.id])
    end
  end
end
