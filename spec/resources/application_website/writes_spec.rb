require 'rails_helper'

RSpec.describe ApplicationWebsiteResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'application_websites',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ApplicationWebsiteResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ApplicationWebsite.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:application_website) { create(:application_website) }

    let(:payload) do
      {
        data: {
          id: application_website.id.to_s,
          type: 'application_websites',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ApplicationWebsiteResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { application_website.reload.updated_at }
      # .and change { application_website.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:application_website) { create(:application_website) }

    let(:instance) do
      ApplicationWebsiteResource.find(id: application_website.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ApplicationWebsite.count }.by(-1)
    end
  end
end
