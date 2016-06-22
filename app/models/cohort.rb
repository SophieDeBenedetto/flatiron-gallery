class Cohort < ApplicationRecord
  has_many :users
  has_many :projects, through: :users
  validates :name, presence: true
end
