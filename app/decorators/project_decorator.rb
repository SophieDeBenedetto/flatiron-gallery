class ProjectDecorator < SimpleDelegator

  def display_technologies
    technologies.map {|t| "##{t.name}"}.join(" ")
  end
end