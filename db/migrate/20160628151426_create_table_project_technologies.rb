class CreateTableProjectTechnologies < ActiveRecord::Migration[5.0]
  def change
    create_table :project_technologies do |t|
      t.references :project, index: true
      t.references :technologie, index: true
    end
  end
end
