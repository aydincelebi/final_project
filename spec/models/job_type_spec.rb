require "rails_helper"

RSpec.describe JobType, type: :model do
  describe "Direct Associations" do
    it { should have_many(:job_categories) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
