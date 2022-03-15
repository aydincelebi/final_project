require "rails_helper"

RSpec.describe JobTypeResource, type: :resource do
  describe "serialization" do
    let!(:job_type) { create(:job_type) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(job_type.id)
      expect(data.jsonapi_type).to eq("job_types")
    end
  end

  describe "filtering" do
    let!(:job_type1) { create(:job_type) }
    let!(:job_type2) { create(:job_type) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: job_type2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([job_type2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:job_type1) { create(:job_type) }
      let!(:job_type2) { create(:job_type) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      job_type1.id,
                                      job_type2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      job_type2.id,
                                      job_type1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
