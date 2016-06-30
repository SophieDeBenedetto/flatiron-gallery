class UserDecorator < SimpleDelegator

  def show_avatar
    avatar.url == "/images/original/missing.png" ? "default-profile.png" : avatar.url(:medium)
  end

  def twitter_form_field
    self.twitter || "twitter"
  end

  def linkedin_form_field
    self.linkedin || "linkedin"
  end

  def github_form_field
    self.github || "github"
  end

  def personal_site_form_field
    self.personal_site || "personal_site"
  end

  def blog_form_field
    self.blog_url || "blog"
  end

  def email_form_field
    self.email || "email"
  end
end
