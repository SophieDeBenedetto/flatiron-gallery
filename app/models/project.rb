class Project < ApplicationRecord
  has_many :collaborations, dependent: :destroy
  has_many :users, through: :collaborations
  has_many :project_technologies
  has_many :technologies, through: :project_technologies
  validates :deployed_url, :github_repos, :name, presence: true
  validates :deployed_url, :github_repos, uniqueness: true
  has_attached_file :screenshot, styles: { medium: "233x240>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :screenshot, content_type: /\Aimage\/.*\Z/

  def github_repos_from_form=(attributes)
    # {"0"=>"http://github.com/sophiedebenedetto/catbook-api", "1"=>"http://github.com/sophiedebenedetto/catbook-front"}
    attributes.each do |key, repo_url|
      self.github_repos << repo_url unless repo_url.strip.empty?
    end
  end

  def technology_ids=(collection)
    binding.pry
    techs = collection.map {|id| Technology.find(id) unless id.empty?}.compact
    self.technologies = techs
  end

  def new_technologies=(collection)
    # {"0"=><ActionController::Parameters {"name"=>"JSON API"}
    collection.each do |key, attributes|
      self.technologies << Technology.find_or_create_by(name: attributes[:name])
    end
  end
end
