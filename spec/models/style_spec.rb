require "rails_helper"

RSpec.describe Style, type: :model do
  describe "Direct Associations" do
    it { should have_many(:interview_styles) }
  end

  describe "InDirect Associations" do
    it { should have_many(:interviews) }
  end

  describe "Validations" do
  end
end
