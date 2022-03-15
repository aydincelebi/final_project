require 'rails_helper'

RSpec.describe JobTypeResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'job_types',
          attributes: { }
        }
      }
    end

    let(:instance) do
      JobTypeResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { JobType.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:job_type) { create(:job_type) }

    let(:payload) do
      {
        data: {
          id: job_type.id.to_s,
          type: 'job_types',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      JobTypeResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { job_type.reload.updated_at }
      # .and change { job_type.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:job_type) { create(:job_type) }

    let(:instance) do
      JobTypeResource.find(id: job_type.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { JobType.count }.by(-1)
    end
  end
end
