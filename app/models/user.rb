class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations
end
