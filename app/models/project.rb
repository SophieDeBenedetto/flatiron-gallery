class Project < ApplicationRecord
  has_many :collaborations
  has_many :users, through: :collaborations
end
