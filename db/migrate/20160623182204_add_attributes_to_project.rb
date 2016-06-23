class AddAttributesToProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :heroku_url
    add_column :projects, :description, :string
    add_column :projects, :deployed_url, :string
  end
end
