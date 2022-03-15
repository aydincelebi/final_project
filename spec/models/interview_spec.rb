require 'rails_helper'

RSpec.describe Interview, type: :model do
  
    describe "Direct Associations" do

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:status).in_array([ "pending", "rejected", "passed" ]) }

    it { should validate_inclusion_of(:take_home).in_array([ "0", "1" ]) }

    end
end
