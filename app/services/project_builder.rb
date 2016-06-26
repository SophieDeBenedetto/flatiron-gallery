class ProjectBuilder
  attr_accessor :attributes, :repo_names, :client, :project

  def initialize(attributes, client)
    @attributes = attributes
    @repo_names = attributes[:github_repos_from_form].map { |key, repo| repo.split("/")[-2..-1].join("/") unless repo.empty? }.compact
    @client = client
  end

  def build
    @project = Project.new(attributes)
    add_collaborators
    take_and_save_screenshot if project.screenshot.url == "missing.png"
    project
  end

  def add_collaborators
    repo_names.each do |repo_name|
      collabs = self.client.get_collaborators(repo_name)
      collabs.each do |collab|
        Collaboration.find_or_create_by(project: project, user: User.find_by(github: collab["login"].downcase))
      end
    end
  end

  def take_and_save_screenshot
    ScreenshotHandler.new(project).get_and_save_screenshot
  end

end