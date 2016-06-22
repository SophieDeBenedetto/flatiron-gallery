require 'rails_helper'

RSpec.describe Cohort, :type => :model do
  context "validations" do 
    describe "#name" do 
      it "is invalid without a name" do
        cohort = FactoryGirl.build(:cohort, name: nil) 
        expect(cohort).to_not be_valid
      end
    end
  end

  context "associations" do 
    describe "users" do 
      it "has many users" do 
        cohort = FactoryGirl.create(:cohort)
        user = FactoryGirl.create(:user, cohort: cohort)
        expect(cohort.users).to include(user)
      end
    end
  end
end
