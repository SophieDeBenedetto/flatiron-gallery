class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations
  validates :email, :first_name, :last_name, presence: true
  

  def self.find_from_auth(auth_hash)
    User.find_by(email: auth_hash["info"]["email"])
  end
end
