require 'csv'
cohort = Cohort.create(name: "web-0416")
CSV.foreach(Rails.root.join('public', 'web-0716.csv'), headers: true) do |row|
  u = User.find_or_create_by(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], github: row["github_username"], cohort: cohort)
  puts "created #{u.first_name} #{u.last_name}"
end

CSV.foreach(Rails.root.join('public', 'web-0716-projects.csv'), headers: true) do |row|
  p = Project.find_or_create_by(deployed_url: row["Heroku Url"])
  p.github_repos = row["github"].split("," || "\n").map {|repo| repo.strip}
  p.name = row["project name"]
  ScreenshotHandler.new(p).get_and_save_screenshot if p.deployed_url && !p.screenshot
  p.save
  ProjectCollaboratorBuilder.new(p, Adapter::GitHubWrapper.new).build
  puts p.name 
  puts p.errors if p.errors.any?
end


Technology.create(name: "Rails")
Technology.create(name: "AJAX")
Technology.create(name: "jQuery")
Technology.create(name: "JavaScript")
Technology.create(name: "Postgresql")
Technology.create(name: "React")
Technology.create(name: "Redux")
Technology.create(name: "Rails 5 API")
Technology.create(name: "Redux Thunk")

cohort2 = Cohort.create(name: "Instructors")
User.create(first_name: "Sophie", last_name: "DeBenedetto", github: "sophiedebenedetto", twitter: "sm_debenedetto", linkedin: "sophiedebenedetto", email: "sophie@flatironschool.com", cohort: cohort2)