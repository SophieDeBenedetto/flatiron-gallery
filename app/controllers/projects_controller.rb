class ProjectsController < ApplicationController

  def index
  end

  def create
    @project = ProjectBuilder.new(project_params, Adapter::GitHubWrapper.new).build
    respond_to do |f|
      if @project.save
        f.js {render "create.js.erb"}
      else
        f.js {render "create_failure.js.erb"}
      end
    end

  end

  private

    def project_params
      params.require(:project).permit(:name, :deployed_url, :description, :github_repos_from_form => ["0", "1"])
    end
end
