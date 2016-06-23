require 'rails_helper'

RSpec.describe Project, :type => :model do
  context "validations" do 
    describe "#deployed_url" do 
      it "is invalid without a deployed url" do 
        user = FactoryGirl.build(:project, deployed_url: nil)
        expect(user).to_not be_valid
      end
    end

    describe "#github_repo" do
      it "is invalid without a github repo" do 
        user = FactoryGirl.build(:project, github_repo: nil)
        expect(user).to_not be_valid
      end
    end

    describe "#name" do
      it "is invalid without a name" do 
        user = FactoryGirl.build(:project, name: nil)
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
    
    describe "users" do 
      it "has many users" do 
        expect(@project.users).to include(@user)
      end
    end
  end
end
