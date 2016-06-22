class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  validates :heroku_url, :github_repo, :name, presence: true
end
