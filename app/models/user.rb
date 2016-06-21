class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations

  def find_from_auth(auth_hash)
    User.find_by(email: ['omniauth.auth']["info"]["email"]) 
  end
end
