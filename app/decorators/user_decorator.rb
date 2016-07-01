class UserDecorator < SimpleDelegator

  def show_avatar
    avatar.url == "/images/original/missing.png" ? "default-profile.png" : avatar.url(:medium)
  end

  def social_links
    social_links = {}
    social_links["github"] = "http://github.com/#{github}" if github
    social_links["email"] = email if email
    social_links["blog"] = blog_url if blog_url
    social_links["twitter"] = "https://twitter.com/#{twitter}" if twitter
    social_links["linkedin"] = "https://linkedin.com/in#{linkedin}" if linkedin
    social_links["personal site"] = personal_site if personal_site
    social_links
  end

  def show_bio
    (bio && !bio.empty?) ? bio : "add your bio here!"
  end
end
