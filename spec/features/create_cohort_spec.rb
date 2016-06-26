require 'rails_helper'
require 'csv'

FIXTURES_PATH = Rails.root.join('spec', 'fixtures')
RSpec.feature 'Create a new Cohort', :type => 'feature' do
  scenario "User uploads a CSV and creates a Cohort", :js => true do
    sign_in
    visit '/dashboard'
    fill_in 'cohort_name', with: 'web-0416'
    attach_file('cohort_csv', "#{FIXTURES_PATH}/students.csv")
    expect {
      click_button 'Create Cohort'
      sleep 1
    }.to change(Cohort, :count).by(1)
  end
end
