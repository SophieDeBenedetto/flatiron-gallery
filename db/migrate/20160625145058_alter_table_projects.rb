class AlterTableProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :github_repo, :string
    add_column :projects, :github_repos, :string, array: true, default: []
  end
end
