require "rails_helper"

RSpec.describe JobApplication, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:job_platform) }

    it { should belong_to(:user) }

    it { should have_many(:job_categories) }

    it { should have_many(:interviews) }

    it { should belong_to(:firm) }
  end

  describe "InDirect Associations" do
    it { should have_many(:categories) }
  end

  describe "Validations" do
    it { should validate_presence_of(:applied_on) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:interest_level) }

    it { should validate_numericality_of(:interest_level).is_equal_to(1) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:platform) }

    it {
      should validate_inclusion_of(:platform).in_array(["Kellogg Job Board",
                                                        "Company Website"])
    }
  end
end
