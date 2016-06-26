class AddScreenshotAttachmentToProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :screenshot 
    add_attachment :projects, :screenshot 
  end
end
