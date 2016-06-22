require 'rails_helper'

RSpec.describe User, :type => :model do
  context "validations" do 
    describe "#email" do 
      it "is invalid without an email" do 
        user = FactoryGirl.build(:user_with_cohort, email: nil)
        expect(user).to_not be_valid
      end
    end

    describe "#first_name" do
      it "is invalid without a firstname" do 
        user = FactoryGirl.build(:user_with_cohort, first_name: nil)
        expect(user).to_not be_valid
      end
    end

    describe "#last_name" do
      it "is invalid without a last name" do 
        user = FactoryGirl.build(:user_with_cohort, last_name: nil)
        expect(user).to_not be_valid
      end
    end
  end

  context "associations" do
    before(:each) do 
      @project = FactoryGirl.create(:project)
      @user = FactoryGirl.create(:user_with_cohort)
      @collaboration = Collaboration.create(project: @project, user: @user) 
    end
    
    describe "projects" do 
      it "has many projects" do 
        expect(@user.projects).to include(@project)
      end
    end

    describe "cohort" do 
      it "belongs to a cohort" do 
        cohort = FactoryGirl.build(:cohort)
        @user.cohort = cohort
        expect(@user.cohort).to eq(cohort)
      end
    end
  end

end
