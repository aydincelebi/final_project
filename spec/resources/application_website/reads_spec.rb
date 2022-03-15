require 'rails_helper'

RSpec.describe ApplicationWebsiteResource, type: :resource do
  describe 'serialization' do
    let!(:application_website) { create(:application_website) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(application_website.id)
      expect(data.jsonapi_type).to eq('application_websites')
    end
  end

  describe 'filtering' do
    let!(:application_website1) { create(:application_website) }
    let!(:application_website2) { create(:application_website) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: application_website2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([application_website2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:application_website1) { create(:application_website) }
      let!(:application_website2) { create(:application_website) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            application_website1.id,
            application_website2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            application_website2.id,
            application_website1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
