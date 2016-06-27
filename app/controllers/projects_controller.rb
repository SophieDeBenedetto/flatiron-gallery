class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = ProjectBuilder.new(project_params).build
    respond_to do |f|
      if @project.save
        ProjectCollaboratorBuilder.new(@project, Adapter::GitHubWrapper.new).build
        f.js {render "create.js.erb"}
      else
        f.js {render "create_failure.js.erb"}
      end
    end

  end

  private

    def project_params
      params.require(:project).permit(:name, :deployed_url, :description, :screenshot, :github_repos_from_form => ["0", "1"])
    end
end
