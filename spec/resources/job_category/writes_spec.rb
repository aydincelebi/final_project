require 'rails_helper'

RSpec.describe JobCategoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'job_categories',
          attributes: { }
        }
      }
    end

    let(:instance) do
      JobCategoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { JobCategory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:job_category) { create(:job_category) }

    let(:payload) do
      {
        data: {
          id: job_category.id.to_s,
          type: 'job_categories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      JobCategoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { job_category.reload.updated_at }
      # .and change { job_category.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:job_category) { create(:job_category) }

    let(:instance) do
      JobCategoryResource.find(id: job_category.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { JobCategory.count }.by(-1)
    end
  end
end
