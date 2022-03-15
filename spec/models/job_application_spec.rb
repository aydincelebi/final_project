require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:platform).in_array([ "Kellogg Job Board", "Company Website" ]) }

    end
end
