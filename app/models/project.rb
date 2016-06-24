class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
  validates :deployed_url, :github_repo, :name, presence: true
  validates :github_repo, uniqueness: true
end
