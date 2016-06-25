require 'rails_helper'

RSpec.describe Project, :type => :model do
  context "validations" do 
    describe "#deployed_url" do 
      it "is invalid without a deployed url" do 
        project = FactoryGirl.build(:project, deployed_url: nil)
        expect(project).to_not be_valid
      end
    end

    describe "#github_repos" do
      it "is invalid without any values in the github_repos array" do 
        project = FactoryGirl.build(:project, github_repos: nil)
        expect(project).to_not be_valid
        project.github_repos = []
        expect(project).to_not be_valid
      end

      it "must have a unique github repo" do 
        project = FactoryGirl.create(:project)
        project_2 = FactoryGirl.build(:project)
        expect(project_2).to_not be_valid
      end
    end

    describe "#name" do
      it "is invalid without a name" do 
        project = FactoryGirl.build(:project, name: nil)
        expect(project).to_not be_valid
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
