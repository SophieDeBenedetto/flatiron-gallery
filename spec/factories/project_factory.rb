FactoryGirl.define do
  factory :project do
    name "hypnotizer"
    deployed_url "hypnotizer.herokuapp.com"
    github_repos ["http://github.com/benny_h/hypnotizer"]
  end
end
