require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_numericality_of(:interest_level).is_equal_to(1) }

    it { should validate_presence_of(:name) }

    it { should validate_presence_of(:platform) }

    it { should validate_inclusion_of(:platform).in_array([ "Kellogg Job Board", "Company Website" ]) }

    end
end
