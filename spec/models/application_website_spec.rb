require 'rails_helper'

RSpec.describe ApplicationWebsite, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:job_applications) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
