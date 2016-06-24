class ProjectBuilder
  attr_accessor :attributes, :repo_name, :client, :project

  def initialize(attributes, client)
    @attributes = attributes
    @repo_name = attributes[:github_repo].split("/")[-2..-1].join("/")
    @client = client
  end

  def build
    @project = Project.new(attributes)
    add_collaborators
    project
  end

  def add_collaborators
    collabs = self.client.get_collaborators(repo_name)
    collabs.each do |collab|
      Collaboration.create(project: project, user: User.find_by(github: collab["login"].downcase))
    end
  end

end