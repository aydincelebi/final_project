require 'rails_helper'

RSpec.describe InterviewStyleResource, type: :resource do
  describe 'serialization' do
    let!(:interview_style) { create(:interview_style) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(interview_style.id)
      expect(data.jsonapi_type).to eq('interview_styles')
    end
  end

  describe 'filtering' do
    let!(:interview_style1) { create(:interview_style) }
    let!(:interview_style2) { create(:interview_style) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: interview_style2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([interview_style2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:interview_style1) { create(:interview_style) }
      let!(:interview_style2) { create(:interview_style) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            interview_style1.id,
            interview_style2.id
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
            interview_style2.id,
            interview_style1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
