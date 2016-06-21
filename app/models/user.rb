class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations

  def self.find_from_auth(auth_hash)
    binding.pry
    User.find_by(email: auth_hash["info"]["email"])
  end
end
