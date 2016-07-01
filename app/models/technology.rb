class Technology < ApplicationRecord
  has_many :project_technologies
  has_many :projects, through: :project_technologies

  validates :name, uniqueness: true
  validate :name, presence: true
end