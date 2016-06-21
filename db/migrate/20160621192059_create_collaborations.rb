class CreateCollaborations < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborations do |t|
      t.references :user, index: true
      t.references :project, index: true
      t.timestamps
    end
  end
end
