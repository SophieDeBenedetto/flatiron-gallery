require 'fileutils'
class ScreenshotHandler

  attr_accessor :project
  PATH_TO_PHANTOM_SCRIPT = Rails.root.join('app', 'assets', 'javascripts', 'screenshot.js')

  def initialize(project)
    @project = project
    @screenshot_filename = "#{project.name.gsub(" ", "_")}.png"
    @path_to_tmp = Rails.root.join('public', 'images', @screenshot_filename)
  end
  
  def get_and_save_screenshot
    Dir.chdir(Rails.root.join('public', 'images'))
    system "phantomjs #{PATH_TO_PHANTOM_SCRIPT} #{project.deployed_url} #{@screenshot_filename}"
    project.screenshot = File.new("#{@path_to_tmp}")
    remove_tmp_image
  end

  def remove_tmp_image
    FileUtils.rm(@path_to_tmp)
  end
end