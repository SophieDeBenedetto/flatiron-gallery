class ProjectFormBuilder < ActionView::Helpers::FormBuilder
 
 # Defining a new method for the custom FormBuilder
 def github_repo_fields
  "<input type='text' name='project[github_repos_from_form][0]' placeholder='add your repo here'><br><input type='text' name='project[github_repos_from_form][1]' placeholder='add your second repo here'>".html_safe

 end
 
end