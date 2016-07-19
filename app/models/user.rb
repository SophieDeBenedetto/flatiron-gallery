class User < ApplicationRecord
  belongs_to :cohort
  has_many :collaborations
  has_many :projects, through: :collaborations

  validates :email, :first_name, :last_name, presence: true

  has_attached_file :avatar, styles: { medium: "320x240>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  before_create :sanitize_github

  def self.find_from_auth(auth_hash)
    User.find_by(email: auth_hash["info"]["email"])
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def first_name_to_email
    "#{first_name}".downcase.concat("@flatironschool.com")
  end

  def sanitize_github
    unless self.github.nil?
      self.github = self.github.downcase
    end
  end

  def set_confirmation_token
    if confirm_token.blank?
       confirm_token = SecureRandom.urlsafe_base64.to_s
       save(validate: false)
    end
  end

end
