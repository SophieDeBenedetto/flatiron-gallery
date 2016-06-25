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

  context "validations" do
    describe "it is unique, no collaboration record can be duplicated" do 
      it "raises an error if a collaboration attempts to save when a record with that user and project id already exists" do
        c = Collaboration.create(project: project, user: user)
        c2 = Collaboration.new(project: project, user: user)
        expect(c2).to_not be_valid
      end
    end 
  end
end
