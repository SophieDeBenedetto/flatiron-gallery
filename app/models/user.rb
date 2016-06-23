class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations
  validates :email, :first_name, :last_name, presence: true
  has_attached_file :avatar, styles: { medium: "320x240>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def self.find_from_auth(auth_hash)
    User.find_by(email: auth_hash["info"]["email"])
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
