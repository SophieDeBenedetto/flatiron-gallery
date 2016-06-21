  class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :heroku_url
      t.string :github_repo
      t.string :screenshot
      t.timestamps
    end
  end
end
