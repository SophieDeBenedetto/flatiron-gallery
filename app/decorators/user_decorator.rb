class UserDecorator < SimpleDelegator

  def show_avatar
    avatar.url == "/images/original/missing.png" ? "default-profile.png" : avatar.url
  end
end