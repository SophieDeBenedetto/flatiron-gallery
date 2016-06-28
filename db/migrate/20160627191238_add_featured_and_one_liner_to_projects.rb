class AddFeaturedAndOneLinerToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :featured, :boolean
    add_column :projects, :one_liner, :string
  end
end
