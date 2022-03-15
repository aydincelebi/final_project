require "rails_helper"

RSpec.describe InterviewStyleResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "interview_styles",
          attributes: {},
        },
      }
    end

    let(:instance) do
      InterviewStyleResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { InterviewStyle.count }.by(1)
    end
  end

  describe "updating" do
    let!(:interview_style) { create(:interview_style) }

    let(:payload) do
      {
        data: {
          id: interview_style.id.to_s,
          type: "interview_styles",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      InterviewStyleResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { interview_style.reload.updated_at }
      # .and change { interview_style.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:interview_style) { create(:interview_style) }

    let(:instance) do
      InterviewStyleResource.find(id: interview_style.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { InterviewStyle.count }.by(-1)
    end
  end
end
