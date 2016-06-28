class ProjectsController < ApplicationController
  skip_before_action :authenticate, only: [:index]
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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    if project.update(project_params)
      redirect_to project_path(project)
    else
      flash[:message] = project.errors
      render :edit
    end
  end

  private

    def project_params
      params.require(:project).permit(:name, :deployed_url, :description, :screenshot, :one_liner, :github_repos_from_form => ["0", "1"], :technology_ids => [], :new_technologies => [:name])
    end
end
