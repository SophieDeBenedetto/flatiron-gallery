require 'faker'
require_relative './cohort_factory'
FactoryGirl.define do
  factory :user do
    first_name "Sophie"
    last_name  "DeBenedetto"
    email "sophie@flatironschool.com"
    github "sophiedebenedetto"
    linkedin "sophiedebenedetto"
    twitter "sm_debenedetto"
    personal_site "sophiedebenedetto.nyc"
    blog_url "http://thegreatcodeadventure.com"
    association :cohort, factory: :cohort
    factory :user_with_cohort do 
      after(:create) do |user|
        c = create(:cohort)
        user.cohort = c
      end
    end
  end

  factory :cohort do
    name "web-0417"
  end
end



