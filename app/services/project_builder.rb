class ProjectBuilder
  attr_accessor :attributes, :project

  def initialize(attributes)
    @attributes = attributes
  end

  def build
    @project = Project.new(attributes)
    take_and_save_screenshot if project.screenshot.url == "missing.png"
    project
  end

  def take_and_save_screenshot
    ScreenshotHandler.new(project).get_and_save_screenshot
  end

end