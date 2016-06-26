require 'rails_helper'
require 'csv'
FIXTURES_PATH = Rails.root.join('spec', 'fixtures')
RSpec.feature 'Create a new Cohort', :type => 'feature' do
  scenario "User uploads a CSV and creates a Cohort", :js => true do
    sign_in
    visit '/dashboard'
    save_and_open_page
    fill_in 'cohort_name', with: 'web-0416'
    attach_file('cohort_csv', "#{FIXTURES_PATH}/students.csv")
    # expect(Cohort.find_by(name: 'web-0416')).to exist
    # expect(Cohort.find_by(name: 'web-0416').members.size).to eq(31)
    click_button 'Create Cohort'
    cohort = Cohort.find_by(name: 'web-0416')
    binding.pry
    expect(cohort.exists?).to eq(true)
    expect(cohort.members.size).to eq(31)
    # expect{
    #   binding.pry
    # }.to change(Cohort, :count).by(1)
  end
end
