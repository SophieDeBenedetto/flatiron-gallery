require 'rails_helper'

RSpec.describe Collaboration, :type => :model do
  
    let(:project) { FactoryGirl.build(:project) }
    let(:user) { FactoryGirl.build(:user) }
    let(:collaboration) { Collaboration.create(project: project, user: user) }

  describe "#project" do 
    it "belongs to a project" do 
      expect(collaboration.project).to eq(project)
    end
  end

  describe "users" do
    it "belongs to a user" do 
      expect(collaboration.user).to eq(user)
    end 
  end
end
