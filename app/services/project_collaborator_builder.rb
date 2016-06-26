class ProjectCollaboratorBuilder

  attr_accessor :project, :client, :repo_names

  def initialize(project, client)
    @project = project
    @client = client
    @repo_names = self.project.github_repos.map { |repo| repo.split("/")[-2..-1].join("/") unless repo.empty? }.compact

  end
  
  def build
    add_collaborators
  end

  def add_collaborators
    self.repo_names.each do |repo_name|
      collabs = self.client.get_collaborators(repo_name)
      collabs.each do |collab|
        Collaboration.find_or_create_by(project: self.project, user: User.find_by(github: collab["login"].downcase))
      end
    end
  end
end