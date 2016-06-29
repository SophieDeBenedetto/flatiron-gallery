class ProjectFormBuilder < ActionView::Helpers::FormBuilder
 
 # Defining a new method for the custom FormBuilder
 def github_repo_fields
  if self.object.new_record?
    "<input type='text' name='project[github_repos_from_form][0]' placeholder='add your repo here'><br><input type='text' name='project[github_repos_from_form][1]' placeholder='add your second repo here'>".html_safe
  else
    "<input type='text' name='project[github_repos_from_form][0]' value='#{self.object.github_repos.first}' placeholder='add your repo here'><br><input type='text' name='project[github_repos_from_form][1]' value='#{self.object.github_repos.second}' placeholder='add your second repo here'>".html_safe
  end
 end
 
end