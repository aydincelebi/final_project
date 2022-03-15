require 'rails_helper'

RSpec.describe JobCategory, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:job_application) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
