require 'omniauth'
require 'capybara'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
  :provider => 'google_oauth2',
  :info => {email: 'antoin@flatironschool.com'}
  })
end

def sign_in
  c = Cohort.create(name: 'instructors')
  User.create(first_name: 'antoin', last_name: 'campbell', email: 'antoin@flatironschool.com', instructor: true, cohort: c, github: 'antoinfive')
  visit '/'
  click_link 'login'
end
