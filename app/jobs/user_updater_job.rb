class UserUpdaterJob < ApplicationJob
  queue_as :default

  def perform(user, attributes)
    user.update(attributes)
  end
end
