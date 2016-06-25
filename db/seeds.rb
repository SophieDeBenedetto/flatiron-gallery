require 'csv'
cohort = Cohort.create(name: "web-0416")
CSV.foreach('/Users/sophiedebenedetto/Downloads/web-0415-new.csv', headers: true) do |row|
  u = User.find_or_create_by(first_name: row["first_name"], last_name: row["last_name"], email: row["email"], github: row["github_username"], cohort: cohort)
  puts "created #{u.first_name} #{u.last_name}"
end