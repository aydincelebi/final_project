require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Direct Associations" do
    it { should have_many(:job_categories) }
  end

  describe "InDirect Associations" do
    it { should have_many(:job_applications) }
  end

  describe "Validations" do
  end
end
