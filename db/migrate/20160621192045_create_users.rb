class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :github
      t.string :linkedin
      t.string :twitter
      t.string :personal_site
      t.string :blog_url
      t.boolean :instructor, default: false
      t.references :cohort, index: true
      t.timestamps
    end
  end
end
