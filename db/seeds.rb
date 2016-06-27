require 'csv'
cohort = Cohort.create(name: "web-0416")
CSV.foreach('/Users/sophiedebenedetto/Downloads/web-0415-new.csv', headers: true) do |row|
  u = User.find_or_create_by(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], github: row["github_username"], cohort: cohort)
  puts "created #{u.first_name} #{u.last_name}"
end

CSV.foreach('/Users/sophiedebenedetto/Desktop/bangarang-projects.csv', headers: true) do |row|
  p = Project.find_or_create_by(deployed_url: row["Heroku/Surge Url"])
  p.github_repos = row["github"].split(",").map {|repo| repo.strip}
  p.name = row["Project Name"]
  ScreenshotHandler.new(p).get_and_save_screenshot if p.deployed_url
  ProjectCollaboratorBuilder.new(p, Adapter::GitHubWrapper.new).build
  p.save
end
