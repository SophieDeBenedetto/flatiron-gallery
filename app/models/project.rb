class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  validates :deployed_url, :github_repos, :name, presence: true
  validates :deployed_url, :github_repos, uniqueness: true


  def github_repos_from_form=(attributes)
    # {"0"=>"http://github.com/sophiedebenedetto/catbook-api", "1"=>"http://github.com/sophiedebenedetto/catbook-front"}
    attributes.each do |key, repo_url|
      self.github_repos << repo_url unless repo_url.strip.empty?
    end
  end
end
