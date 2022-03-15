require 'rails_helper'

RSpec.describe InterviewStyle, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:style) }

    it { should belong_to(:interview) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
