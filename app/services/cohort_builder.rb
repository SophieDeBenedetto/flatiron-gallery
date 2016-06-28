require 'csv'

class CohortBuilder
  attr_accessor :cohort

  def initialize(params)
    @csv = params['csv']
    @cohort = Cohort.new(name: params['name'])
  end

  def build
    if @csv.nil?
      return false
    else
      CSV.foreach(@csv.tempfile, headers: :true) do |row|
        User.find_or_create_by(first_name: row['first_name'], last_name: row['last_name'], github: row['github_username'], email: row['email'], cohort: cohort)
        end
      end
      cohort
    end
end
