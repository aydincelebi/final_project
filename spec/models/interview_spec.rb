require 'rails_helper'

RSpec.describe Interview, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:role) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_inclusion_of(:interview_round).in_array([ "Application", "1st Round", "2nd Round", "3rd Round", "Final Round" ]) }

    it { should validate_presence_of(:status) }

    it { should validate_inclusion_of(:status).in_array([ "pending", "rejected", "passed" ]) }

    it { should validate_inclusion_of(:take_home).in_array([ "0", "1" ]) }

    end
end
